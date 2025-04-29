//
//  FinishedView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct FinishedView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 32) {
                Image("Gwangsan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .clipped()
                
                Text("회원가입이\n완료되었습니다")
                    .multilineTextAlignment(.center)
                    .gwangsanFont(style: .titleMedium)
                    .gwangsanColor(GwangsanAsset.Color.mainBlue500)
            }
            .padding(.top, 100)
            
            Spacer()
            
            GwangsanButton(
                text: "로그인 페이지로 돌아가기",
                buttonState: true,
                horizontalPadding: 24,
                height: 52,
                destination: StartView()
            )
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    FinishedView()
}
