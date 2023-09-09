//
//  ProfileView.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 3/9/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // (((fullname + username) + bio + stats) + profile image) + button + content
            VStack {
                // ((fullname + username) + bio + stats) + profile image
                HStack(alignment: .top) {
                    // (fullname + username) + bio + stats
                    VStack(alignment: .leading, spacing: 12) {
                        // (fullname + username)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Lee Hsien Loong")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("leehsienloong")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        Text("Politican")
                            .font(.footnote)
                        
                        Text("684k followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    CircularProfileImageView()
                }
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)

                }
                
                // User content list view
                VStack {
                    // Tabs
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
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
                    
                    // Content
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self) { thread in
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
