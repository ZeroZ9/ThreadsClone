//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 2/4/24.
//

import Foundation
import Combine
import Observation
import Firebase

@Observable
class ContentViewModel {
    var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSesion in
            self?.userSession = userSesion
        }.store(in: &cancellables)
    }
}
