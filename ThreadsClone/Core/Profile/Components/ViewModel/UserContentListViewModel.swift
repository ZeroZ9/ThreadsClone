//
//  UserContentListViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 8/4/24.
//

import Foundation
import Observation

@Observable
class UserContentListViewModel {
    var threads = [Thread]()
    var replies = [ThreadReply]()
    let user: User
    
    init(user: User) {
        self.user = user
        Task {
            try await fetchUserThreads()
        }
        
        Task {
            try await fetchUserReplies()
        }
    }
    
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
    
    func fetchUserReplies() async throws {
        self.replies = try await ThreadService.fetchThreadReplies(forUser: user)
        
        try await fetchReplyThreadData()
    }
    
    func fetchReplyThreadData() async throws {
        
        for i in 0 ..< replies.count {
            let reply = replies[i]
            
            var thread = try await ThreadService.fetchThread(threadId: reply.threadId)
            thread.user = try await UserService.fetchUser(withUid: thread.ownerUid)
            
            replies[i].thread = thread
        }
    }
}
