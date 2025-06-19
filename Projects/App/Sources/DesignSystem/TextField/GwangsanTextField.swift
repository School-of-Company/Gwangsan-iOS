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
    @Binding var isError: Bool
    @FocusState private var isFocused: Bool
    var title: String
    var placeholder: String
    var horizontalPadding: CGFloat
    var errorMessage: String?
    var onSubmit: () -> Void

    private var borderColor: Color {
        if isError {
            return GwangsanAsset.Color.error.swiftUIColor
        } else if isFocused {
            return GwangsanAsset.Color.mainYellow400.swiftUIColor
        } else {
            return GwangsanAsset.Color.gray400.swiftUIColor
        }
    }

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        title: String = "",
        horizontalPadding: CGFloat = 20,
        isError: Binding<Bool>,
        errorMessage: String? = nil,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._text = text
        self._isError = isError
        self.title = title
        self.placeholder = placeholder
        self.horizontalPadding = horizontalPadding
        self.errorMessage = errorMessage
        self.onSubmit = onSubmit
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(borderColor, lineWidth: 1)

                TextField("", text: $text, prompt: Text(placeholder))
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.horizontal, 16)
                    .focused($isFocused)
                    .onSubmit(onSubmit)
            }
            .frame(height: 56)

            if isError, let error = errorMessage, !error.isEmpty {
                Text(error)
                    .font(.system(size: 13))
                    .foregroundColor(GwangsanAsset.Color.error.swiftUIColor)
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}
