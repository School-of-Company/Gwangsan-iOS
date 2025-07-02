//
//  SignUpPasswordView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Updated by ChatGPT on 2025/07/03.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct SignUpPasswordView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var confirmPassword: String = ""
    @State private var showPasswordError: Bool = false
    @State private var showConfirmError: Bool = false
    @State private var shouldNavigate: Bool = false

    /// 비밀번호와 재입력이 모두 입력돼야 활성화
    private var isReadyForNavigation: Bool {
        !viewModel.password.isEmpty && !confirmPassword.isEmpty
    }

    var body: some View {
        VStack {
            // — 헤더 & 설명
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

                // — 입력 필드
                VStack(spacing: 32) {
                    GwangsanTextField(
                        "비밀번호를 입력해주세요",
                        text: $viewModel.password,
                        title: "비밀번호",
                        horizontalPadding: 24,
                        isError: $showPasswordError,
                        errorMessage: "비밀번호를 입력해주세요"
                    ) {
                        showPasswordError = viewModel.password.isEmpty
                    }

                    GwangsanTextField(
                        "비밀번호를 다시 입력해주세요",
                        text: $confirmPassword,
                        title: "비밀번호 재입력",
                        horizontalPadding: 24,
                        isError: $showConfirmError,
                        errorMessage: "비밀번호가 일치하지 않습니다"
                    ) {
                        showConfirmError = confirmPassword != viewModel.password
                    }
                }
            }
            .padding(.top, 16)

            Spacer()

            // — 다음 버튼
            GwangsanButton(
                text: "다음",
                buttonState: isReadyForNavigation,
                horizontalPadding: 24,
                height: 52,
                style: .filled
            ) {
                // 필드 체크
                if viewModel.password.isEmpty {
                    showPasswordError = true
                    return
                }
                if confirmPassword.isEmpty {
                    showConfirmError = true
                    return
                }
                if viewModel.password == confirmPassword {
                    showPasswordError = false
                    showConfirmError = false
                    shouldNavigate = true
                } else {
                    showConfirmError = true
                }
            }
            .padding(.bottom, 30)
        }
        // — 여기서만 BackButtonModifier를 사용해 "한 단계 pop" 동작
        .modifier(BackButtonModifier())
        // — 상위 NavigationStack 에 정의된 navigationDestination을 타고 push 됩니다.
        .navigationDestination(isPresented: $shouldNavigate) {
            PhoneVerificationView(viewModel: viewModel)
        }
        // — (Preview용) 루트에 NavigationStack이 있어야 정상 동작
    }
}

#Preview {
    NavigationStack {
        SignUpPasswordView(viewModel: SignUpViewModel())
    }
}

