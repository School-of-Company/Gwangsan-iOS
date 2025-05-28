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
            
            VStack(alignment: .leading, spacing: 8){
                Text("신고사유")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextEditor(text: $reason)
                    .frame(height: 185)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(GwangsanAsset.Color.mainYellow500.swiftUIColor, lineWidth: 1)
                    )
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        Group {
                            if reason.isEmpty {
                                Text("신고사유를 입력해주세요")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 14)
                                    .padding(.top, 12)
                                    .allowsHitTesting(false)
                            }
                        }
                    )
            }
            
            Spacer()
            
            Button(action: {
                print("신고 사유 제출: \(reason)")
                dismiss()
            }) {
                Text("신고하기")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(reason.isEmpty ? Color.gray : Color.red)
                    .cornerRadius(10)
            }
            .disabled(reason.isEmpty)
        }
        .padding(24)
    }
}

#Preview {
    ReportSheetView()
}
