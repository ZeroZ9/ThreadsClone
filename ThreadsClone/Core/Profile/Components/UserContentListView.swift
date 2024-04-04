//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import SwiftUI

struct UserContentListView: View {
    
    @State private var selectedFilter: ProfileThreadFiler = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFiler.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
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

#Preview {
    UserContentListView()
}
