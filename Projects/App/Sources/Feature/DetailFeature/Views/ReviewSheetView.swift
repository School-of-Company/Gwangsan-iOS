//
//  ReviewSheetView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/31/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ReviewSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var brightness: Double = 0.5
    @State private var tradereview: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("후기")
                    .gwangsanFont(style: .body1)
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image("Close")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            .padding(.bottom, 40)
           
            VStack(alignment: .leading, spacing: 16) {
                      Text("밝기")
                          .font(.subheadline)
                          .foregroundColor(.black)
                
                      CustomSliderView(value: $brightness)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("후기작성")
                    .gwangsanFont(style: .label)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $tradereview)
                        .font(.system(size: 14))
                        .frame(height: 185)
                        .padding(8)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(GwangsanAsset.Color.mainYellow500.swiftUIColor, lineWidth: 1)
                        )
                        .cornerRadius(8)

                    if tradereview.isEmpty {
                        Text("거래의 후기를 입력해주세요.")
                            .font(.system(size: 14))
                            .gwangsanColor(GwangsanAsset.Color.gray400)
                            .padding(14)
                    }
                }
            }

            Spacer()
       
            GwangsanButton(
                text: "작성완료",
                buttonState: !tradereview.isEmpty,
                horizontalPadding: 0,
                height: 52,
                style: .filled,
                action: {
                    print("\(tradereview)")
                }
            )
            .padding(.bottom, 30)
        }
        .padding(24)
    }
}

#Preview {
    ReviewSheetView()
}
