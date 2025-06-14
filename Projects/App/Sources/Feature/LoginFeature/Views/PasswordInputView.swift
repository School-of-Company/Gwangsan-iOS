//
//  PasswordInputVIew.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PasswordInputView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack(spacing: 54) {
                    VStack(alignment: .leading) {
                        Text("로그인")
                            .gwangsanFont(style: .titleMedium)
                        
                        Text("비밀번호를 입력해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    
                    GwangsanTextField(
                        "비밀번호를 입력해주세요",
                        text: $viewModel.password,
                        title: "비밀번호",
                        horizontalPadding: 24
                    )
                }
                .padding(.top, 16)
                
                Spacer()
                
                GwangsanButton(
                    text: "다음",
                    buttonState: !viewModel.password.isEmpty,
                    horizontalPadding: 24,
                    height: 52,
                    destination: MainView(),
                    action: {
                        viewModel.submit()
                    }
                )
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
    }
}

#Preview {
    PasswordInputView(viewModel: LoginViewModel())
}
