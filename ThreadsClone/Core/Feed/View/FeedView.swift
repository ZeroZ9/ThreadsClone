//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import SwiftUI

struct FeedView: View {
    
    @State var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        NavigationLink(value: thread) {
                            ThreadCell(thread: thread)
                        }
                    }
                }
            }
            .navigationDestination(for: Thread.self, destination: { thread in
                ThreadDetailView(thread: thread)
            })
            .refreshable {
                Task {
                    try await viewModel.fetchThreads()
                }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
    }
}
