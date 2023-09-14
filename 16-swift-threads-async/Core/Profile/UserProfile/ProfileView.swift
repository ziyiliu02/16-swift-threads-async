//
//  ProfileView.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 3/9/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // (((fullname + username) + bio + stats) + profile image) + button + content
            VStack {
                // ((fullname + username) + bio + stats) + profile image
                ProfileHeaderView(user: user)
                
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
                UserContentListView(user: user)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
