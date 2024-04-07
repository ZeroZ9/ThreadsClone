//
//  User.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
