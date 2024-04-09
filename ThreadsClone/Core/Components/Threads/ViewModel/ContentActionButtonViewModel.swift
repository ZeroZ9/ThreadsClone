//
//  ContentActionButtonViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 8/4/24.
//

import Foundation
import Observation

@Observable
class ContentActionButtonViewModel {
    var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task {
            try await checkIfUserLikedThread()
        }
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikedThread(thread)
        
        // only execute if therad has been liked
        if didLike {
            self.thread.didLike = true
        }
    }
}
