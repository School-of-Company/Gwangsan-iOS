//
//  GwangsanButton.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

public enum GwangsanButtonStyle {
    case filled
    case outline
}

public struct GwangsanButton<Destination: View>: View {
    var text: String
    var fontSize: CGFloat
    var buttonState: Bool
    var horizontalPadding: CGFloat
    var height: CGFloat
    var style: GwangsanButtonStyle
    var destination: Destination?
    var action: () -> Void

    @State private var isLinkActive = false

    public init(
        text: String,
        fontSize: CGFloat = 18,
        buttonState: Bool,
        horizontalPadding: CGFloat,
        height: CGFloat,
        style: GwangsanButtonStyle = .filled,
        destination: Destination? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.fontSize = fontSize
        self.buttonState = buttonState
        self.horizontalPadding = horizontalPadding
        self.height = height
        self.style = style
        self.destination = destination
        self.action = action
    }

    public var body: some View {
        Group {
            if let destination = destination, buttonState {
                NavigationLink(destination: destination, isActive: $isLinkActive) {
                    buttonContent
                }
                .simultaneousGesture(TapGesture().onEnded {
                    action()
                    isLinkActive = true
                })
            } else {
                Button(action: {
                    action()
                }) {
                    buttonContent
                }
                .disabled(!buttonState)
            }
        }
    }

    private var buttonContent: some View {
        ZStack {
            if style == .filled {
                RoundedRectangle(cornerRadius: 12)
                    .fill(buttonState ? GwangsanAsset.Color.mainGreen500.swiftUIColor : GwangsanAsset.Color.gray200.swiftUIColor)
            } else if style == .outline {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(GwangsanAsset.Color.mainGreen500.swiftUIColor, lineWidth: 1)
                    )
            }

            Text(text)
                .font(.system(size: fontSize))
                .fontWeight(.semibold)
                .foregroundColor(
                    style == .filled
                    ? (buttonState ? .white : GwangsanAsset.Color.gray500.swiftUIColor)
                    : GwangsanAsset.Color.mainGreen500.swiftUIColor
                )
        }
        .padding(.horizontal, horizontalPadding)
        .frame(height: height)
    }
}
