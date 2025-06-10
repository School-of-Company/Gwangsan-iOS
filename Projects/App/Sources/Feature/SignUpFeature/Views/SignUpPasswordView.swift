//
//  SignUpPasswordView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct SignUpPasswordView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    
    func isValid() -> Bool {
        return !viewModel.password.isEmpty && viewModel.password == viewModel.confirmPassword
    }

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 54) {
                    VStack(alignment: .leading) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)

                        Text("비밀번호를 입력해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                    VStack(spacing: 32) {
                        GwangsanTextField(
                            "비밀번호를 입력해주세요",
                            text: $viewModel.password,
                            title: "비밀번호",
                            horizontalPadding: 24
                        )

                        GwangsanTextField(
                            "비밀번호를 다시 입력해주세요",
                            text: $viewModel.confirmPassword,
                            title: "비밀번호 재입력",
                            horizontalPadding: 24
                        )
                    }
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: isValid(),
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
    SignUpPasswordView()
}
