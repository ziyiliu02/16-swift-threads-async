//
//  ExploreViewModel.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 11/9/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor 
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers() 
    }
}
