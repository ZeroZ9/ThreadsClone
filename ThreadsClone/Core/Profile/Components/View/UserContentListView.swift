//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 3/4/24.
//

import SwiftUI

struct UserContentListView: View {
    
    @State var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFiler = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFiler.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    init(user: User) {
        self._viewModel = State(wrappedValue: UserContentListViewModel(user: user))
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
                switch selectedFilter {
                case .threads:
                    ForEach(viewModel.threads) { thread in
                       ThreadCell(thread: thread)
                            .transition(.move(edge: .leading))
                    }
                case .replies:
                    ForEach(viewModel.replies) { reply in
                        ThreadReplyProfileCell(reply: reply)
                            .transition(.move(edge: .trailing))
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

//#Preview {
//    UserContentListView()
//}
