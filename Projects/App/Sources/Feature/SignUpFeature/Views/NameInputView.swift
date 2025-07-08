//
//  NameInputView.swift
//  Gwangsan
//
//  Created by 박정우 on 6/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct NameInputView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var showError = false
    @State private var shouldNavigate = false

    var body: some View {
        VStack {
            VStack(spacing: 54) {
                VStack(alignment: .leading) {
                    Text("회원가입")
                        .gwangsanFont(style: .titleMedium)
                    Text("이름을 입력해주세요")
                        .gwangsanFont(style: .label)
                        .gwangsanColor(GwangsanAsset.Color.gray500)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)

                GwangsanTextField(
                    "본인의 이름을 입력해주세요",
                    text: $viewModel.name,
                    title: "이름",
                    horizontalPadding: 24,
                    isError: $showError,
                    errorMessage: "한글만 입력해주세요"
                ) {
                    showError = !viewModel.isNameValid
                }
            }
            .padding(.top, 16)

            Spacer()

            GwangsanButton(
                text: "다음",
                buttonState: !viewModel.name.isEmpty,
                horizontalPadding: 24,
                height: 52,
                style: .filled
            ) {
                if viewModel.isNameValid {
                    showError = false
                    shouldNavigate = true
                } else {
                    showError = true
                }
            }
            .padding(.bottom, 30)

            // 비활성화된 네비게이션 링크
            NavigationLink(
                destination: NicknameInputView(viewModel: viewModel),
                isActive: $shouldNavigate
            ) {
                EmptyView()
            }
            .hidden()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackButtonModifier())
    }
}

#Preview {
    NavigationStack {
        NameInputView(viewModel: SignUpViewModel())
    }
}
