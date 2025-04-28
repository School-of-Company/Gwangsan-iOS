//
//  ReferenceView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/28/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ReferenceView: View {
    @State var reference: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 54) {
                    VStack(alignment: .leading) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)

                        Text("추천인의 별칭을 작성해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                        GwangsanTextField(
                            "추천인 별칭을 입력해주세요",
                            text: $reference,
                            title: "추천인",
                            horizontalPadding: 24
                        )
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: !reference.isEmpty,
                    horizontalPadding: 24,
                    height: 52,
                    destination: PhoneVerificationView()
                )
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
    }
}

#Preview {
     ReferenceView()
}
