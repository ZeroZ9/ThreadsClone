//
//  ThreadReplyViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 9/4/24.
//

import Foundation
import Observation
import Firebase

@Observable
class ThreadReplyViewModel {
    
    func uploadThreadReply(replyText: String, thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        let reply = ThreadReply(
            threadId: thread.id,
            replyText: replyText,
            threadReplyOwnerUid: uid,
            threadOwnerUid: thread.ownerUid,
            timestamp: Timestamp()
        )
        try await ThreadReplyService.uploadThreadReply(reply, toThread: thread)
    }
}
