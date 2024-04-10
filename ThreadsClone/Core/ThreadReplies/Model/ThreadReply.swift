//
//  ThreadReply.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 9/4/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadReply: Codable, Identifiable {
    @DocumentID var replyId: String?
    let threadId: String
    let replyText: String
    let threadReplyOwnerUid: String
    let threadOwnerUid: String
    let timestamp: Timestamp
    
    var thread: Thread?
    var replyUser: User?
    
    var id: String {
        return replyId ?? UUID().uuidString
    }
    
     
}
