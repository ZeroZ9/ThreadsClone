//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 2/4/24.
//

import Foundation
import Observation

@Observable
class RegistrationViewModel {
    var email = ""
    var password = ""
    var fullname = ""
    var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
    }
}
