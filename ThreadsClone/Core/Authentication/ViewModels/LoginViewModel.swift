//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 2/4/24.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var email = ""
    var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
