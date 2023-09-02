//
//  _6_swift_threads_asyncApp.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 2/9/23.
//

import FirebaseCore
import SwiftUI

@main
struct _6_swift_threads_asyncApp: App {
    
    init() {
        FirebaseApp.configure() 
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
