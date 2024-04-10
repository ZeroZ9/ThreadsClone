//
//  ThreadReplyService.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 9/4/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadReplyService {
    
    static func uploadThreadReply(_ reply: ThreadReply, toThread thread: Thread) async throws {
        guard let replyData = try? Firestore.Encoder().encode(reply) else { return }
        async let _ = try await FirestoreConstants.RepliesCollection.document().setData(replyData)
        async let _ = try await FirestoreConstants.ThreadsCollection.document(thread.id).updateData(["replyCount" : thread.replyCount + 1])
    }
}
