//
//  PostCreateStep2View.swift
//  Gwangsan
//
//  Created by 박정우 on 6/6/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PostCreateStep2View: View {
    @State var point: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack {
                    HStack {
                        Image("Back")
                        Spacer()
                        Text("필요해요")
                            .gwangsanFont(style: .body1)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: { dismiss() }) {
                            Image("Close")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                    }
                }
                GwangsanTextField(
                    "광산을 입력해주세요",
                    text: $point,
                    title: "광산",
                    horizontalPadding: 0
                )
                .padding(.top,30)
                
                Spacer()
                
                GwangsanButton(
                    text: "다음",
                    buttonState: !point.isEmpty,
                    horizontalPadding: 0,
                    height: 52,
                    style: .filled,
                    destination: PostCreateStep2View()
                )
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 24)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PostCreateStep2View()
}
