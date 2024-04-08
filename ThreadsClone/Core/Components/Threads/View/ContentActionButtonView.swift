//
//  ContentActionButtonView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 8/4/24.
//

import SwiftUI

struct ContentActionButtonView: View {
    
    @State var viewModel:ContentActionButtonViewModel
    
    init(thread: Thread) {
        self.viewModel = ContentActionButtonViewModel(thread: thread)
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
    var body: some View {
        HStack(spacing: 16){
            Button(action: {
                handleLikeTapped()
            }, label: {
                Image(systemName: didLike ? "heart.fill" : "heart")
                    .foregroundStyle(didLike ? .red : .black)
            })
            
            Button(action: {
                
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
        .foregroundStyle(.black)
        .padding(.vertical, 8)
    }
    
    func handleLikeTapped() {
        if didLike {
            viewModel.unlikeThread()
        } else {
            viewModel.likeThread()
        }
    }
}

//#Preview {
//    ContentActionButtonView()
//}
