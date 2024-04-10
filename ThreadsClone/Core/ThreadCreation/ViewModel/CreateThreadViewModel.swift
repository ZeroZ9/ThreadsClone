//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 8/4/24.
//

import Foundation
import Observation
import Firebase

@Observable
class CreateThreadViewModel {

    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0, replyCount: 0)
        try await ThreadService.uploadThread(thread)
    }
}
