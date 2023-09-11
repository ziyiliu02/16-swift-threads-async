//
//  User.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 10/9/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String? 
}