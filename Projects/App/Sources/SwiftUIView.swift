//
//  SwiftUIView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/10/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .gwangsanFont(style: .titleLarge)
            .gwangsanColor(GwangsanAsset.Color.gray900)
        GwangsanAsset.Assets.chat.swiftUIImage
    }
}

#Preview {
    SwiftUIView()
}
