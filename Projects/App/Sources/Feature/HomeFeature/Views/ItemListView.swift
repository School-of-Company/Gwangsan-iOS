//
//  ItemListView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/15/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ItemListView: View {
    @State private var selected: CommonItem.Category = .request
    @Environment(\.dismiss) private var dismiss

    let allItems: [CommonItem] = [
        CommonItem(
            id: UUID(),
            title: "아이폰 16 필요해요",
            point: 3000,
            category: .request,
            imageName: "TestImage1",
            content: "아이폰 필요해 사줭 아이폰 필요해 사줭아이폰 필요해 사줭아이폰 필요해 사줭아이폰 필요해 사줭아이폰 필요해 사줭아이폰 필요해 사줭아이폰 필요해 사줭",
            mode: .item
        ),
        CommonItem(
            id: UUID(),
            title: "자전거 팔아요",
            point: 3000,
            category: .provide,
            imageName: "TestImage2",
            content: "자전거 필요없어요~자전거 필요없어요~자전거 필요없어요~자전거 필요없어요~자전거 필요없어요~자전거 필요없어요~자전거 필요없어요~자전거 필요없어요~",
            mode: .item
        )
    ]

    var filteredItems: [CommonItem] {
        allItems.filter { $0.category == selected }
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                let width = UIScreen.main.bounds.width - 48

                VStack(alignment: .leading) {
                    ZStack {
                        Text("물건")
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

                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .gwangsanColor(GwangsanAsset.Color.mainYellow300)

                        HStack {
                            if selected == .provide { Spacer() }

                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.white)
                                .frame(width: width / 2, height: 35)

                            if selected == .request { Spacer() }
                        }
                        .frame(width: width)
                        .animation(.easeInOut(duration: 0.25), value: selected)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 7)

                        HStack(spacing: 0) {
                            ForEach(CommonItem.Category.allCases, id: \.self) { type in
                                Button(action: {
                                    selected = type
                                }) {
                                    Text(type.displayName(for: .item))
                                        .font(.system(size: 14))
                                        .foregroundColor(
                                            selected == type ? Color.black : GwangsanAsset.Color.gray800.swiftUIColor
                                        )
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            }
                        }
                    }
                    .frame(height: 45)
                    .padding(.bottom, 20)

                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(filteredItems) { item in
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
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 24)

                NavigationLink(destination: PostCreateStep1View(
                    headerTitle: selected.displayName(for: .item),
                    viewModel: PostDraftViewModel())
                ) {
                    Circle()
                        .fill(GwangsanAsset.Color.mainGreen500.swiftUIColor)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image("Write")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(14)
                        )
                }
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ItemListView()
}
