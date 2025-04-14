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

    private var borderColor: Color {
           isFocused ? GwangsanAsset.Color.mainYellow400.swiftUIColor : .black
    }

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        title: String = ""
    ) {
        self._text = text
        self.placeholder = placeholder
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)

            TextField("", text: $text, prompt: Text(placeholder))
                .font(.system(size: 14))
                .fontWeight(.medium)
                .frame(height: 56)
                .padding(.horizontal, 22)
                .focused($isFocused)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(borderColor)
                }
                .cornerRadius(12)
        }
        .padding(.horizontal, 20)
    }
}
