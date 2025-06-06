//
//  PostCreatePage.swift
//  Gwangsan
//
//  Created by 박정우 on 6/6/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI
import PhotosUI

struct PostCreatePage: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    @State private var topic: String = ""
    @State private var content = ""
    @State private var selectedImages: [UIImage] = []
    @State private var photoItems: [PhotosPickerItem] = []

    var isFormValid: Bool {
        !topic.isEmpty && !content.isEmpty
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Image("Back")
                    Spacer()
                    Text("필요해요")
                        .gwangsanFont(style: .body1)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image("Close")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }

            GwangsanTextField(
                "이름을 입력해주세요",
                text: $topic,
                title: "주제",
                horizontalPadding: 0
            )
            .padding(.top, 30)

            VStack(alignment: .leading, spacing: 5) {
                Text("내용")
                    .gwangsanFont(style: .label)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $content)
                        .font(.system(size: 14))
                        .frame(height: 185)
                        .padding(8)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(
                                    isFocused
                                    ? GwangsanAsset.Color.mainYellow500.swiftUIColor
                                    : GwangsanAsset.Color.gray400.swiftUIColor,
                                    lineWidth: 2
                                )
                        )
                        .cornerRadius(8)
                        .focused($isFocused)

                    if content.isEmpty {
                        Text("내용을 작성해주세요")
                            .font(.system(size: 14))
                            .gwangsanColor(GwangsanAsset.Color.gray400)
                            .padding(14)
                    }
                }
            }
            .padding(.top, 25)

            VStack(alignment: .leading, spacing: 8) {
                Text("사진첨부")
                    .gwangsanFont(style: .label)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(selectedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        }

                        PhotosPicker(
                            selection: $photoItems,
                            maxSelectionCount: 5,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            ZStack {
                                Circle()
                                    .fill(GwangsanAsset.Color.gray50.swiftUIColor)
                                    .frame(width: 64, height: 64)
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            }
                        }
                        .onChange(of: photoItems) { newItems in
                            for item in newItems {
                                Task {
                                    if let data = try? await item.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        if !selectedImages.contains(uiImage) {
                                            selectedImages.append(uiImage)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, 10)

            Spacer()

            GwangsanButton(
                text: "다음",
                buttonState: isFormValid,
                horizontalPadding: 0,
                height: 52,
                style: .filled
            )
            .padding(.bottom, 30)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    PostCreatePage()
}
