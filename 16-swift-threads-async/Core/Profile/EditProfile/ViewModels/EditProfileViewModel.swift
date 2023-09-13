//
//  EditProfileViewModel.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 12/9/23.
//

import Foundation
import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.selectedImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
