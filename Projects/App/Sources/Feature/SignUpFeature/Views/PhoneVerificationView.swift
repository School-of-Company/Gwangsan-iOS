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
    @StateObject private var phoneVM = PhoneVerificationViewModel()
    @State private var shouldNavigate = false

    private var canGoNext: Bool {
        phoneVM.isCodeSent && phoneVM.verificationCode.count == 6 && phoneVM.errorMessage == nil
    }

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
                        VStack(spacing: 4) {
                            HStack(spacing: 12) {
                                GwangsanTextField(
                                    "전화번호를 입력해주세요",
                                    text: $phoneVM.phoneNumber,
                                    title: "전화번호",
                                    horizontalPadding: 0,
                                    isError: .constant(false),
                                    errorMessage: nil
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
                            isError: .constant(phoneVM.errorMessage != nil && phoneVM.isCodeSent),
                            errorMessage: phoneVM.errorMessage
                        )
                    }
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: canGoNext,
                    horizontalPadding: 24,
                    height: 52,
                    style: .filled
                ) {
                    phoneVM.verifyCode()
                    if phoneVM.errorMessage == nil {
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
}

#Preview {
    PhoneVerificationView(viewModel: SignUpViewModel())
}
