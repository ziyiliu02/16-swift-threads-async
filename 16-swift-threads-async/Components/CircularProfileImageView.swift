//
//  CircularProfileImageView.swift
//  16-swift-threads-async
//
//  Created by Liu Ziyi on 4/9/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("LHL")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}
