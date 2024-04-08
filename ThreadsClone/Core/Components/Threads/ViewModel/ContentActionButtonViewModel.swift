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
    
    func likeThread() {
        self.thread.didLike = true
    }
    
    func unlikeThread() {
        self.thread.didLike = false
    }
}
