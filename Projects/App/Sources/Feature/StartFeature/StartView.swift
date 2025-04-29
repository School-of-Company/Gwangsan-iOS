//
//  StartView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack{
                
                Spacer()
                
                NavigationLink (destination: NicknameInputView()) {
                    Text("회원가입")
                        .frame(maxWidth: .infinity)
                        .gwangsanFont(style: .body1)
                        .frame(height: 52)
                        .foregroundColor(GwangsanAsset.Color.mainGreen500.swiftUIColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(GwangsanAsset.Color.mainGreen500.swiftUIColor, lineWidth: 1)
                        )
                        .padding(.horizontal, 24)
                }
                NavigationLink (destination: AliasInputView()) {
                    Text("로그인")
                        .frame(maxWidth: .infinity)
                        .gwangsanFont(style: .body1)
                        .frame(height: 52)
                        .background(GwangsanAsset.Color.mainGreen500.swiftUIColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
            }
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    StartView()
}
