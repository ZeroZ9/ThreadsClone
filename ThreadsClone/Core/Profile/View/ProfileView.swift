//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFiler = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFiler.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            
            VStack{
                HStack(alignment: .top){
                    // bio and stats
                    VStack(alignment: .leading, spacing: 12){
                        
                        //fullnname and username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Charles Leclerc")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("charles_leclerc")
                                .font(.subheadline)
                        }
                        
                        Text("Formula 1 driver for Ferrari")
                            .font(.footnote)
                        
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
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
