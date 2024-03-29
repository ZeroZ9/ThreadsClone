//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("max")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
