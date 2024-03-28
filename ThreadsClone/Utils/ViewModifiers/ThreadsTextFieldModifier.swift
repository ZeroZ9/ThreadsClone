//
//  ThreadTextFieldModifier.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import Foundation
import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal,24)
    }
}
