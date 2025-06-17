//
//  ModifyProfileView.swift
//  Gwangsan
//
//  Created by 박정우 on 6/14/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ModifyProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showError: Bool = false
    @State var nickname: String = "" // 뷰모델
    var body: some View {
        NavigationStack{
            VStack{
                ZStack {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image("Back")
                        }
                        Spacer()
                        Text("내 정보 수정")
                            .gwangsanFont(style: .body1)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Image("Close")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                VStack(spacing: 25) {
                    GwangsanTextField(
                        "별칭을 입력해주세요",
                        text: $nickname,
                        title: "별칭",
                        horizontalPadding: 0,
                        isError: $showError,
                        onSubmit: {
                           
                        }
                    )
                    .padding(.top, 25)
//                    GwangsanTextField(
//                        "별칭을 입력해주세요",
//                        text: $nickname,
//                        title: "별칭",
//                        horizontalPadding: 0
//                    )
//                    GwangsanTextField(
//                        "별칭을 입력해주세요",
//                        text: $nickname,
//                        title: "별칭",
//                        horizontalPadding: 0
//                    )
//                    GwangsanTextField(
//                        "별칭을 입력해주세요",
//                        text: $nickname,
//                        title: "별칭",
//                        horizontalPadding: 0
//                    )
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            GwangsanButton(
                text: "수정",
                buttonState: true,  // 필드값이 다 입력되면 true
                horizontalPadding: 20,
                height: 56,
                action: {
                    // 뷰모델 검사후 서버로 ㄱㄱ
                }
            )
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ModifyProfileView()
}
