//
//  LoginViewModel.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 10/9/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
