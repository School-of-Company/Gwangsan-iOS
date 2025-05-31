//
//  ReportSheetView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/27/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ReportSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var reason: String = ""
    @State private var reportType: String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack {
                    Text("신고하기")
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
                .padding(.top, 30)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("신고유형")
                        .gwangsanFont(style: .label)
                    
                    DropdownSelector(
                        options: ["허위매물등록", "신고유형 추가"],
                        placeholder: "신고유형을 선택해주세요",
                        selectedOption: $reportType
                    )
                }
                .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("신고사유")
                        .gwangsanFont(style: .label)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $reason)
                            .font(.system(size: 14))
                            .frame(height: 185)
                            .padding(8)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(GwangsanAsset.Color.mainYellow500.swiftUIColor, lineWidth: 1)
                            )
                            .cornerRadius(8)
                        
                        if reason.isEmpty {
                            Text("신고사유를 입력해주세요")
                                .font(.system(size: 14))
                                .gwangsanColor(GwangsanAsset.Color.gray400)
                                .padding(14)
                        }
                    }
                }
                
                Spacer()
                
                GwangsanButton(
                    text: "신고하기",
                    buttonState: !reason.isEmpty,
                    horizontalPadding: 0,
                    height: 52,
                    style: .danger,
                    destination: SwiftUIView()
                )
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    ReportSheetView()
}
