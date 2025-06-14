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
            title: "이름",
            horizontalPadding: 20
        )
        
        GwangsanButton(
            text: "다음",
            buttonState: true,
            horizontalPadding: 20,
            height: 56
        )
        
        HStack(spacing: 12) {
            GwangsanTextField(
                "전화번호를 입력해주세요",
                text: $inputText,
                title: "전화번호",
                horizontalPadding: 0
            )
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            
            GwangsanButton(
                text: "인증",
                buttonState: false,
                horizontalPadding: 0,
                height: 56
            )
            .padding(.top, 16)
            .frame(width: 80)
        }
        .padding(.horizontal, 21)
    }
}

#Preview {
    SwiftUIView()
}
