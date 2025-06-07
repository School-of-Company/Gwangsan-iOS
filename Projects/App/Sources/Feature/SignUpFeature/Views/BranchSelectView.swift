//
//  BranchSelectView.swift
//  Gwangsan
//
//  Created by 박정우 on 6/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct BranchSelectView: View {
    @State private var keyword: String = ""
    @State private var selectedLocation: String? = nil

    private let allLocations = ["첨단 1동", "첨단 2동", "첨단 3동", "운암동", "풍암동", "쌍촌동"]

    var filteredLocations: [String] {
        if keyword.isEmpty { return [] }
        return allLocations.filter { $0.contains(keyword) }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)
                        Text("동네를 선택해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                    GwangsanTextField(
                        "동네를 검색해주세요",
                        text: $keyword,
                        title: "",
                        horizontalPadding: 24
                    )
                    .padding(.vertical, 20)
                }
                .padding(.top, 16)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: selectedLocation != nil,
                    horizontalPadding: 24,
                    height: 52,
                    destination: MajorSelectView()
                )
                .padding(.top, 16)
                .padding(.bottom, 30)
            }
            .modifier(BackButtonModifier())
        }
    }
}

#Preview {
    BranchSelectView()
}
