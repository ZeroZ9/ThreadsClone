//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFiler = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFiler.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false) {
                
                VStack{
                    HStack(alignment: .top){
                        // bio and stats
                        VStack(alignment: .leading, spacing: 12){
                            
                            //fullnname and username
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }
                            
                            if let bio = currentUser?.bio{
                                Text(bio)
                                    .font(.footnote)
                            }
                            
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                    //user content list view
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFiler.allCases) { filter in
                                VStack{
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }

                            }
                        }
                        
                        LazyVStack {
                            ForEach(0 ... 10, id:\.self) { thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
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
    ProfileView()
}
