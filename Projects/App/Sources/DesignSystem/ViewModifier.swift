//
//  ViewModifier.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            GwangsanAsset.Assets.back.swiftUIImage
                                .frame(width: 8, height: 14)
                            Text("뒤로")
                                .font(.system(size: 14))
                                .gwangsanColor(GwangsanAsset.Color.gray500)
                        }
                        .padding(.horizontal, 14)
                    }
                    .contentShape(Rectangle())
                }
            }
    }
}

