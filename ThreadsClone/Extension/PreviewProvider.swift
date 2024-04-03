//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: UUID().uuidString, fullname: "Max Verstappen", email: "max@gmailc.om", username: "max1")
}
