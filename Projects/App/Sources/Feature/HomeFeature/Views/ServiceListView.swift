//
//  ServiceListView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/15/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ServiceListView: View {
    enum FilterType: String, CaseIterable {
        case request = "해주세요"
        case provide = "할수있어요"
    }

    @State private var selected: FilterType = .request
    @Environment(\.dismiss) private var dismiss

    let allItems: [CommonItem] = [
        CommonItem(
            id: UUID(),
            title: "바퀴벌레 좀 잡아주세요",
            point: 3000,
            category: .request,
            imageName: "TestImage1",
            mode: .service
        ),
        CommonItem(
            id: UUID(),
            title: "집 청소좀 해주세요",
            point: 3000,
            category: .request,
            imageName: "TestImage2",
            mode: .service
        ),
        CommonItem(
            id: UUID(),
            title: "바퀴벌레 잡아드려요",
            point: 3000,
            category: .provide,
            imageName: "TestImage3",
            mode: .service
        ),
        CommonItem(
            id: UUID(),
            title: "운동 도와드려요",
            point: 3000,
            category: .provide,
            imageName: "TestImage4",
            mode: .service
        )
    ]

    var filteredItems: [CommonItem] {
        allItems.filter { item in
            selected == .request ? item.category == .request : item.category == .provide
        }
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                let width = UIScreen.main.bounds.width - 48

                VStack(alignment: .leading) {
                    ZStack {
                        Text("서비스")
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
                            ForEach(FilterType.allCases, id: \.self) { type in
                                Button(action: {
                                    selected = type
                                }) {
                                    Text(type.rawValue)
                                        .font(.system(size: 14))
                                        .foregroundColor(
                                            selected == type ? .black : GwangsanAsset.Color.gray800.swiftUIColor
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
                    .buttonStyle(PlainButtonStyle())

                    Spacer()
                }
                .padding(.horizontal, 24)

                NavigationLink(destination: PostView()) {
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
    ServiceListView()
}

#Preview {
    ServiceListView()
}
