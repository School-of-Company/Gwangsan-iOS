//
//  SwiftUIView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/10/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State var inputText: String = ""
    var body: some View {
        Text("Hello, World!")
            .gwangsanFont(style: .titleLarge)
            .gwangsanColor(GwangsanAsset.Color.mainYellow400)
        GwangsanAsset.Assets.chat.swiftUIImage
     
        
        GwangsanTextField(
            "이름을 입력해주세요",
            text: $inputText,
            title: "이름"
        )
    }
}

#Preview {
    SwiftUIView()
}
