//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top){
            // bio and stats
            VStack(alignment: .leading, spacing: 12){
                
                //fullnname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio{
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

//#Preview {
//    ProfileHeaderView()
//}
