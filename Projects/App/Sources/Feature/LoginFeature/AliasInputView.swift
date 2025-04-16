//
//  LoginView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct AliasInputView: View {
    @State var nickname: String = "" // viewModel에서 사용
    var body: some View {
        NavigationStack {
            VStack{
                VStack(spacing: 54){
                    VStack(alignment: .leading) {
                        Text("로그인")
                            .gwangsanFont(style: .titleMedium)
                        
                        Text("별칭을 입력해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    
                    GwangsanTextField(
                        "별칭을 입력해주세요",
                        text: $nickname,
                        title: "별칭",
                        horizontalPadding: 24
                    )
                }
                .padding(.top, 16)
                
                Spacer()
                
                GwangsanButton(
                    text: "다음",
                    buttonState: !nickname.isEmpty,
                    horizontalPadding: 24,
                    height: 52,
                    destination: PasswordInputView()
                )
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    AliasInputView()
} 
