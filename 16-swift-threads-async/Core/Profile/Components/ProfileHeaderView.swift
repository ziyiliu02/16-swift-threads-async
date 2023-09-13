//
//  ProfileHeaderView.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 12/9/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            // (fullname + username) + bio + stats
            VStack(alignment: .leading, spacing: 12) {
                // (fullname + username)
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("684k followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
