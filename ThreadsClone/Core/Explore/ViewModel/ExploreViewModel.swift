//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import Foundation
import Observation

@Observable
class ExploreViewModel {
    var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
