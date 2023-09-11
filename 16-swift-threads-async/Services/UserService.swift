//
//  UserService.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 11/9/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self) //decode the user that we get back from our snapshot 
        self.currentUser = user
    }
    
}
