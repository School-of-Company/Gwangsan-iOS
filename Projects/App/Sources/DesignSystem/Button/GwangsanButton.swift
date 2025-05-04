//
//  GwangsanButton.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

public struct GwangsanButton<Destination: View>: View {
    var text: String
    var fontSize: CGFloat
    var buttonState: Bool
    var horizontalPadding: CGFloat
    var height: CGFloat
    var destination: Destination?
    var action: () -> Void

    @State private var isLinkActive = false

    public init(
        text: String,
        fontSize: CGFloat = 18,
        buttonState: Bool,
        horizontalPadding: CGFloat,
        height: CGFloat,
        destination: Destination? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.fontSize = fontSize
        self.buttonState = buttonState
        self.horizontalPadding = horizontalPadding
        self.height = height
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
            RoundedRectangle(cornerRadius: 12)
                .fill(buttonState ? GwangsanAsset.Color.mainGreen500.swiftUIColor : GwangsanAsset.Color.gray200.swiftUIColor)

            Text(text)
                .font(.system(size: fontSize))
                .fontWeight(.semibold)
                .foregroundColor(buttonState ? .white : GwangsanAsset.Color.gray500.swiftUIColor)
        }
        .padding(.horizontal, horizontalPadding)
        .frame(height: height)
    }
}
