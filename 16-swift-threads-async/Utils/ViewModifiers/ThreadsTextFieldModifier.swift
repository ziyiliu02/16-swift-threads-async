//
//  ThreadsTextFieldModifier.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 3/9/23.
//

import SwiftUI 

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
