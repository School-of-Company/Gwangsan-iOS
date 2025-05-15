//
//  MyPosts.swift
//  Gwangsan
//
//  Created by 박정우 on 5/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MyPostItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let point: Int
    let category: String
}

struct MyPostsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCategory = ""
    @State private var selectedType = ""

    let items: [MyPostItem] = [
        MyPostItem(imageName: "TestImage1", title: "바퀴벌레 좀 잡아주세요", point: 3000, category: "서비스"),
        MyPostItem(imageName: "TestImage2", title: "집 청소좀 해주세요", point: 3000, category: "서비스"),
        MyPostItem(imageName: "TestImage3", title: "자전거 팔아요", point: 5000, category: "팔아요")
    ]

    var filteredItems: [MyPostItem] {
        items.filter { item in
            (selectedCategory.isEmpty || item.category == selectedCategory)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    Text("내 글")
                        .gwangsanFont(style: .body1)

                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 24, height: 24)
                                .gwangsanColor(GwangsanAsset.Color.gray500)
                        }
                        Spacer()
                    }
                }
                .padding(.bottom, 30)

                Text("카테고리 선택 후 내 글 확인")
                    .gwangsanFont(style: .titleSmall)
                    .padding(.bottom, 16)

                HStack(alignment: .top, spacing: 24) {
                    DropdownSelector(
                        options: ["서비스", "물건"],
                        placeholder: "선택",
                        selectedOption: $selectedCategory
                    )

                    DropdownSelector(
                        options: ["해주세요", "팔아요"],
                        placeholder: "선택",
                        selectedOption: $selectedType
                    )
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(filteredItems) { item in
                            HStack(alignment: .center, spacing: 24) {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipped()
                                    .cornerRadius(8)

                                VStack(alignment: .leading, spacing: 12) {
                                    Text(item.title)
                                        .gwangsanFont(style: .body3)

                                    Text("\(item.point) 광산")
                                        .font(.system(size: 14))
                                }

                                Spacer()
                            }
                            .padding(.vertical, 16)
                        }
                    }
                }
                .padding(.top, 24)

                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MyPostsView()
}
