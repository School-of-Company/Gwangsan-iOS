//
//  GwangsanButton.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

public struct GwangsanButton: View {
    var text: String
    var buttonState: Bool
    var horizontalPadding: CGFloat
    var height: CGFloat
    var action: () -> Void

    @State private var isPressed = false

    public init(
        text: String,
        buttonState: Bool,
        horizontalPadding: CGFloat,
        height: CGFloat,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.buttonState = buttonState
        self.horizontalPadding = horizontalPadding
        self.height = height
        self.action = action
    }

    public var body: some View {
        Button(action: {
            self.action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(buttonState ? GwangsanAsset.Color.mainGreen500.swiftUIColor : GwangsanAsset.Color.gray200.swiftUIColor)
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(buttonState ? .white : GwangsanAsset.Color.gray500.swiftUIColor)
            }
            .padding(.horizontal, horizontalPadding)
            .frame(height: height)
        }
        .disabled(!buttonState) 
    }
}

