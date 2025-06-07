//
//  BranchSelectView.swift
//  Gwangsan
//
//  Created by 박정우 on 6/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct BranchSelectView: View {
    @State private var selectedLocation: String = ""
    private let allLocations = [
        "첨단 1동",
        "첨단 2동",
        "첨단 3동",
        "운암동",
        "풍암동",
        "쌍촌동"
    ]

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)
                        Text("동네를 선택해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    DropdownSelector(
                        options: allLocations,
                        placeholder: "지점을 선택해주세요",
                        selectedOption: $selectedLocation
                    )
                    .padding(.top, 45)
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)

                Spacer()

                GwangsanButton(
                    text: "다음",
                    buttonState: !selectedLocation.isEmpty,
                    horizontalPadding: 24,
                    height: 52,
                    style: .filled,
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
