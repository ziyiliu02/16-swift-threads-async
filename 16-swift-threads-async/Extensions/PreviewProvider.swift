//
//  PreviewProvider.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 11/9/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Lee Hsien Loong", email: "lhl@email.com", username: "leehsienloong")
}
