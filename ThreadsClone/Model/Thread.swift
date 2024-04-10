//
//  Thread.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 8/4/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable, Hashable{
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var replyCount: Int
    
    var didLike: Bool? = false
    
    var id: String {
        return threadId ?? UUID().uuidString
    }
    var user: User?
}
