//
//  ThreadDetailView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 10/4/24.
//

import SwiftUI

struct ThreadDetailView: View {
    
    let thread: Thread
    @State var viewModel: ThreadDetailViewModel
    init(thread: Thread) {
        self.thread = thread
        self._viewModel = State(wrappedValue: ThreadDetailViewModel(thread: thread))
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    CircularProfileImageView(user: thread.user, size: .small)
                    
                    Text(thread.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(thread.timestamp.timestampString())
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray3))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.darkGray))
                    })
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(thread.caption)
                        .font(.subheadline)
                    
                    ContentActionButtonView(thread: thread)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
                .padding(.vertical)
            
            LazyVStack{
                ForEach(viewModel.replies) { reply in
                    ThreadReplyCell(reply: reply)
                }
            }
        }
        .padding()
        .navigationTitle("Thread")
        .navigationBarTitleDisplayMode(.inline)
    }
}
