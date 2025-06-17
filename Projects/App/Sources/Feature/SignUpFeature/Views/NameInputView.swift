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
    @State private var showError: Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                VStack(spacing: 54){
                    VStack(alignment: .leading) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)
                        
                        Text("별칭을 입력해주세요")
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
                            isError: $showError
                        )
                }
                .padding(.top, 16)
                
                Spacer()
                
                GwangsanButton(
                    text: "다음",
                    buttonState: !viewModel.name.isEmpty,
                    horizontalPadding: 24,
                    height: 52,
                    destination: NicknameInputView(viewModel: viewModel)
                )
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NameInputView(viewModel: SignUpViewModel())
}
