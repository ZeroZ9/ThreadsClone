//
//  ContentActionButtonView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 8/4/24.
//

import SwiftUI

struct ContentActionButtonView: View {
    
    let thread: Thread
    @State var viewModel:ContentActionButtonViewModel
    @State private var showReplySheet = false
    
    init(thread: Thread) {
        self.thread = thread
        self._viewModel = State(wrappedValue: ContentActionButtonViewModel(thread: thread))
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
//    private var thread: Thread {
//        return viewModel.thread
//    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 16){
                Button(action: {
                    handleLikeTapped()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundStyle(didLike ? .red : .black)
                })
                
                Button(action: {
                    showReplySheet.toggle()
                }, label: {
                    Image(systemName: "bubble.right")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.rectanglepath")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane")
                })
            }
            
            HStack(spacing: 4){
                if thread.replyCount > 0 {
                    Text("\(thread.replyCount) replies")
                }
                
                if thread.replyCount > 0 && thread.likes > 0 {
                    Text("-")
                }
                
                if viewModel.thread.likes > 0 {
                    Text("\(viewModel.thread.likes) likes")
                }
            }
            .font(.caption)
            .foregroundStyle(.gray)
            .padding(.vertical, 4)
        }
        .sheet(isPresented: $showReplySheet, content: {
            ThreadReplyView(thread: thread)
        })
        .foregroundStyle(.black)
        .padding(.vertical, 8)
    }
    
    func handleLikeTapped() {
        Task{
            if didLike {
                try await viewModel.unlikeThread()
            } else {
                try await viewModel.likeThread()
            }
        }
    }
}

//#Preview {
//    ContentActionButtonView()
//}
