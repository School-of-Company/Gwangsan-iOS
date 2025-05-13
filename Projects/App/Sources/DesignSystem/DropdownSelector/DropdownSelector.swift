//
//  DropdownSelector.swift
//  Gwangsan
//
//  Created by 박정우 on 5/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct DropdownSelector: View {
    var options: [String]
    var placeholder: String
    @Binding var selectedOption: String

    @State private var isExpanded = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    HStack {
                        Text(selectedOption.isEmpty ? placeholder : selectedOption)
                            .font(.system(size: 16))
                            .foregroundColor(.black)

                        Spacer()

                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(.black)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(GwangsanAsset.Color.mainYellow500.swiftUIColor, lineWidth: 1)
                    )
                }

                if isExpanded {
                    VStack(spacing: 0) {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                selectedOption = option
                                isExpanded = false
                            }) {
                                Text(option)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 22)
                                    .padding(.vertical, 13)
                            }
                            .background(Color.white)
                        }
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(GwangsanAsset.Color.mainYellow500.swiftUIColor, lineWidth: 1)
                    )
                    .padding(.top, 8)
                    .zIndex(1)
                }
            }
        }
    }
}
