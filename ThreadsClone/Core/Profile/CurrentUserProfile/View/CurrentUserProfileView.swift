//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false) {
                
                VStack(spacing: 20){
                    
                    ProfileHeaderView(user: currentUser)
                    
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    })
                    
                    //user content list view
                    if let currentUser {
                        UserContentListView(user: currentUser)
                    }
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
