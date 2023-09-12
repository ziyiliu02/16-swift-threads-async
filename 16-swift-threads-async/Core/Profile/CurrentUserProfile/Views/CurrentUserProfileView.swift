//
//  CurrentUserProfileView.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 11/9/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var showEditProfile = false
    @StateObject var viewModel = CurrentProfileViewModel()
    
    private var currentUser: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // (((fullname + username) + bio + stats) + profile image) + button + content
                VStack {
                    // ((fullname + username) + bio + stats) + profile image
                    ProfileHeaderView(user: currentUser)
                    
                    Button {
                        showEditProfile.toggle() 
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }

                    }
                    
                    // User content list view
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                EditProfileView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.logout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
            .padding(.horizontal)
        }
        .foregroundColor(.black)
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
