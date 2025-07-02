//
//  PhoneVerificationView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Updated by ChatGPT on 2025/07/03.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PhoneVerificationView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @StateObject private var phoneVM = PhoneVerificationViewModel()
    @State private var shouldNavigate = false

    /// 인증 버튼을 눌러 코드가 전송된 상태이고, 인증번호 필드가 비어있지 않으면 활성화
    private var isNextEnabled: Bool {
        phoneVM.isCodeSent && !phoneVM.verificationCode.isEmpty
    }

    var body: some View {
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
                        VStack(spacing: 4) {
                            HStack(spacing: 12) {
                                GwangsanTextField(
                                    "전화번호를 입력해주세요",
                                    text: $phoneVM.phoneNumber,
                                    title: "전화번호",
                                    horizontalPadding: 0,
                                    isError: $phoneVM.isPhoneError
                                )
                                .frame(height: 56)
                                .frame(maxWidth: .infinity)

                                GwangsanButton(
                                    text: "인증",
                                    buttonState: !phoneVM.phoneNumber.isEmpty,
                                    horizontalPadding: 0,
                                    height: 56
                                ) {
                                    phoneVM.sendCode()
                                }
                                .frame(width: 80)
                                .padding(.top, 20)
                            }
                            .padding(.horizontal, 24)

                            if let error = phoneVM.errorMessage, !phoneVM.isCodeSent {
                                Text(error)
                                    .font(.caption)
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 24)
                            }
                        }

                        GwangsanTextField(
                            "인증번호를 입력해주세요",
                            text: $phoneVM.verificationCode,
                            title: "전화번호 인증",
                            horizontalPadding: 24,
                            isError: $phoneVM.isCodeError,
                            errorMessage: phoneVM.errorMessage
                        )
                    }
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: isNextEnabled,
                    horizontalPadding: 24,
                    height: 52,
                    style: .filled
                ) {
                    phoneVM.verifyCode()

                    // 인증 성공 시 viewModel에 전화번호 복사 후 다음 화면으로 이동
                    if !phoneVM.isCodeError {
                        viewModel.phoneNumber = phoneVM.phoneNumber
                        shouldNavigate = true
                    }
                }
                .padding(.bottom, 30)
                .navigationDestination(isPresented: $shouldNavigate) {
                    LocationSelectView(viewModel: viewModel)
                }
            }
            .modifier(BackButtonModifier())
    }
}

#Preview {
    PhoneVerificationView(viewModel: SignUpViewModel())
}
