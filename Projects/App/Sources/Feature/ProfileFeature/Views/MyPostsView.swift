//
//  MyPosts.swift
//  Gwangsan
//
//  Created by 박정우 on 5/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MyPostsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCategory = ""
    @State private var selectedType = ""

    let items: [CommonItem] = [
        CommonItem(id: UUID(), title: "바퀴벌레 좀 잡아주세요", point: 3000, category: .request, imageName: "TestImage1", content: "바퀴벌레 요청", mode: .service),
        CommonItem(id: UUID(), title: "집 청소좀 해주세요", point: 3000, category: .request, imageName: "TestImage2", content: "집 청소 요청", mode: .service),
        CommonItem(id: UUID(), title: "자전거 팔아요", point: 5000, category: .provide, imageName: "TestImage3", content: "자전거 판매", mode: .item)
    ]

    var filteredItems: [CommonItem] {
        items.filter { item in
            let categoryMatches = selectedCategory.isEmpty ||
                (selectedCategory == "서비스" && item.mode == .service) ||
                (selectedCategory == "물건" && item.mode == .item)

            let typeMatches = selectedType.isEmpty ||
                (selectedType == "해주세요" && item.category == .request && item.mode == .service) ||
                (selectedType == "할수있어요" && item.category == .provide && item.mode == .service) ||
                (selectedType == "필요해요" && item.category == .request && item.mode == .item) ||
                (selectedType == "팔아요" && item.category == .provide && item.mode == .item)

            return categoryMatches && typeMatches
        }
    }

    private func typeOptions(for category: String) -> [String] {
        switch category {
        case "서비스": return ["해주세요", "할수있어요"]
        case "물건": return ["필요해요", "팔아요"]
        default: return []
        }
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ZStack {
                    Text("내 글")
                        .gwangsanFont(style: .body1)

                    HStack {
                        Button(action: { dismiss() }) {
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
                        options: typeOptions(for: selectedCategory),
                        placeholder: "선택",
                        selectedOption: $selectedType
                    )
                }
                .onChange(of: selectedCategory) { _ in
                    selectedType = ""
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(filteredItems) { item in
                            NavigationLink(destination: MyPostDetailView(item: item)) {
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
