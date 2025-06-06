//
//  PostCreatePage.swift
//  Gwangsan
//
//  Created by 박정우 on 6/6/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PostCreatePage: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    @State var topic:String = ""
    @State var content = ""
    
    var body: some View {
        VStack{
            ZStack {
                HStack{
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
                "이름을 입력해주세요",
                text: $topic,
                title: "주제",
                horizontalPadding: 0
            )
            
            VStack(alignment: .leading, spacing: 5) {
                Text("신고사유")
                    .gwangsanFont(style: .label)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $content)
                        .font(.system(size: 14))
                        .frame(height: 185)
                        .padding(8)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(
                                    isFocused
                                    ? GwangsanAsset.Color.mainYellow500.swiftUIColor
                                    :GwangsanAsset.Color.gray400.swiftUIColor,
                                    lineWidth: 2
                                )
                        )
                        .cornerRadius(8)
                        .focused($isFocused)
                    
                    if content.isEmpty {
                        Text("내용을 작성해주세요")
                            .font(.system(size: 14))
                            .gwangsanColor(GwangsanAsset.Color.gray400)
                            .padding(14)
                    }
                }
                
                Spacer()
            }
            
        }
        .padding(.horizontal,24)
    }
}

#Preview {
    PostCreatePage()
}
