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
    }
    
    func likeThread() async throws {
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
