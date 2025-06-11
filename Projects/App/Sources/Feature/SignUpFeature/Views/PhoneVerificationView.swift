//
//  PhoneVerificationView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PhoneVerificationView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State var phoneNumber: String = ""
    @State var confirmnumber: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 54) {
                    VStack(alignment: .leading) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)

                        Text("전화번호를 입력해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                    VStack(spacing: 32) {
                        HStack(spacing: 12) {
                            GwangsanTextField(
                                "전화번호를 입력해주세요",
                                text: $phoneNumber,
                                title: "전화번호",
                                horizontalPadding: 0
                            )
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            
                            GwangsanButton(
                                text: "인증",
                                buttonState: phoneNumber.isEmpty,
                                horizontalPadding: 0,
                                height: 56,
                                action: {
                                   print("전화번호 인증")
                                }
                            )
                            .padding(.top, 20)
                            .frame(width: 80)
                        }
                        .padding(.horizontal, 20)
                        GwangsanTextField(
                            "인증번호를 입력해주세요",
                            text: $confirmnumber,
                            title: "전화번호 인증",
                            horizontalPadding: 24
                        )
                    }
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: true, // 전화번호 인증이 완료되면 true로 변경하게 만들어야함
                    horizontalPadding: 24,
                    height: 52,
                    destination: LocationSelectView(viewModel: viewModel)
                )
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
    }
}
