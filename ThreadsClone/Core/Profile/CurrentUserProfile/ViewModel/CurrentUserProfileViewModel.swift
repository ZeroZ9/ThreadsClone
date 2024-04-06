//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import Foundation
import Combine
import Observation
import PhotosUI
import SwiftUI

@Observable
class CurrentUserProfileViewModel {
    var currentUser: User?
    var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    
    var profileImage: Image?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            //print("DEBUG: User in view model from combine is \(user)")
        }.store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
    }
}

