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
    let text: String
    let fontSize: CGFloat
    let buttonState: Bool
    let horizontalPadding: CGFloat
    let height: CGFloat
    let style: GwangsanButtonStyle
    let destination: Destination?
    let action: () -> Void

    @State private var isPressed = false
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
                    if style == .outline {
                        pressEffectAndNavigate()
                    } else {
                        isLinkActive = true
                    }
                    action()
                })
            } else {
                Button(action: {
                    if style == .outline {
                        pressEffectOnly()
                    }
                    action()
                }) {
                    buttonContent
                }
                .disabled(!buttonState)
            }
        }
    }

    private func pressEffectAndNavigate() {
        isPressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPressed = false
            isLinkActive = true
        }
    }

    private func pressEffectOnly() {
        isPressed = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPressed = false
        }
    }

    private var buttonContent: some View {
        let isTempFilled = style == .outline && isPressed
        let isNowFilled = style == .filled && buttonState
        let isOutlineBorder = style == .outline && buttonState && !isPressed
        let isInactive = !buttonState

        return ZStack {
            // Background
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    isNowFilled || isTempFilled
                    ? GwangsanAsset.Color.mainGreen500.swiftUIColor
                    : (style == .filled ? GwangsanAsset.Color.gray200.swiftUIColor : .white)
                )
                .overlay(
                    isOutlineBorder
                    ? RoundedRectangle(cornerRadius: 12)
                        .stroke(GwangsanAsset.Color.mainGreen500.swiftUIColor, lineWidth: 1)
                    : nil
                )
                .overlay(
                    style == .outline && isInactive
                    ? RoundedRectangle(cornerRadius: 12)
                        .stroke(GwangsanAsset.Color.gray400.swiftUIColor, lineWidth: 1)
                    : nil
                )

            // Text
            Text(text)
                .font(.system(size: fontSize))
                .fontWeight(.semibold)
                .foregroundColor(
                    isNowFilled || isTempFilled
                    ? .white
                    : (
                        style == .filled
                        ? GwangsanAsset.Color.gray500.swiftUIColor
                        : (buttonState ? GwangsanAsset.Color.mainGreen500.swiftUIColor : GwangsanAsset.Color.gray400.swiftUIColor)
                    )
                )
        }
        .padding(.horizontal, horizontalPadding)
        .frame(height: height)
    }
}
