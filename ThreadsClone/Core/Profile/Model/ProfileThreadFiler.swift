//
//  ProfileThreadFiler.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import Foundation

enum ProfileThreadFiler: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
