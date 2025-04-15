//
//  GwangsanTextField.swift
//  Gwangsan
//
//  Created by 박정우 on 4/12/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct GwangsanTextField: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    var title: String
    var placeholder: String
    var horizontalPadding: CGFloat

    private var borderColor: Color {
        isFocused ? GwangsanAsset.Color.mainYellow400.swiftUIColor : .black
    }

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        title: String = "",
        horizontalPadding: CGFloat = 20
    ) {
        self._text = text
        self.placeholder = placeholder
        self.title = title
        self.horizontalPadding = horizontalPadding
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(borderColor)

                TextField("", text: $text, prompt: Text(placeholder))
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.horizontal, 22)
                    .focused($isFocused)
            }
            .frame(height: 56)
        }
        .padding(.horizontal, horizontalPadding)
    }
}
