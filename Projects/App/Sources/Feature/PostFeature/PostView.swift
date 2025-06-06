//
//  PostView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PostView: View {
    @State private var selectedCategory = ""
    @State private var selectedType = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("게시글")
                    .gwangsanFont(style: .body1)
                    .padding(.bottom, 30)

                let allItems: [CommonItem] = [
                    CommonItem(
                        id: UUID(),
                        title: "바퀴벌레 좀 잡아주세요",
                        point: 3000,
                        category: .request,
                        imageName: "TestImage1",
                        content: "바퀴벌레 좀 잡아주세요...",
                        mode: .service
                    ),
                    CommonItem(
                        id: UUID(),
                        title: "집 청소좀 해주세요",
                        point: 3000,
                        category: .request,
                        imageName: "TestImage2",
                        content: "집 청소좀 해주세요...",
                        mode: .service
                    ),
                    CommonItem(
                        id: UUID(),
                        title: "바퀴벌레 잡아드려요",
                        point: 3000,
                        category: .provide,
                        imageName: "TestImage3",
                        content: "바퀴벌레 잡아드려요...",
                        mode: .service
                    ),
                    CommonItem(
                        id: UUID(),
                        title: "운동 도와드려요",
                        point: 3000,
                        category: .provide,
                        imageName: "TestImage4",
                        content: "운동 도와드려요...",
                        mode: .service
                    ),
                    CommonItem(
                        id: UUID(),
                        title: "아이폰 16 필요해요",
                        point: 3000,
                        category: .request,
                        imageName: "TestImage1",
                        content: "아이폰 필요해 사줭...",
                        mode: .item
                    ),
                    CommonItem(
                        id: UUID(),
                        title: "자전거 팔아요",
                        point: 3000,
                        category: .provide,
                        imageName: "TestImage2",
                        content: "자전거 필요없어요~",
                        mode: .item
                    )
                ]

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
                .padding(.bottom, 30)
                .onChange(of: selectedCategory) { _ in
                    selectedType = ""
                }

                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(filteredItems(from: allItems)) { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                HStack(spacing: 16) {
                                    Image(item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipped()
                                        .cornerRadius(8)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(item.title)
                                            .gwangsanFont(style: .body3)
                                            .foregroundColor(.black)
                                        Text("\(item.point) 광산")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                    }

                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .padding(.horizontal, 24)
        }
    }

    private func filteredItems(from items: [CommonItem]) -> [CommonItem] {
        items.filter { item in
            let categoryMatches = selectedCategory.isEmpty ||
                (selectedCategory == "서비스" && item.mode == .service) ||
                (selectedCategory == "물건" && item.mode == .item)

            let typeMatches = selectedType.isEmpty ||
                (selectedType == "해주세요" && item.category == .request) ||
                (selectedType == "할 수 있어요" && item.category == .provide) ||
                (selectedType == "팔아요" && item.category == .provide) ||
                (selectedType == "필요해" && item.category == .request)

            return categoryMatches && typeMatches
        }
    }

    private func typeOptions(for category: String) -> [String] {
        switch category {
        case "서비스":
            return ["해주세요", "할 수 있어요"]
        case "물건":
            return ["팔아요", "필요해"]
        default:
            return []
        }
    }
}

#Preview {
    PostView()
}
