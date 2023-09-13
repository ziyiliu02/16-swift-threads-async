//
//  ThreadService.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 13/9/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
}
