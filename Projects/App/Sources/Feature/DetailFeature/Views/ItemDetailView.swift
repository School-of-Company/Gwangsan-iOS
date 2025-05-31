//
//  ItemDetailVeiw.swift
//  Gwangsan
//
//  Created by 박정우 on 5/20/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    let item: CommonItem
    @Environment(\.dismiss) private var dismiss
    @State private var isReportSheetPresented = false
    @State private var isReviewSheetPresented = false

    var categoryText: String {
        item.category.displayName(for: item.mode)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    Text("\(item.mode)")
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
                .padding(.horizontal, 24)
                .padding(.bottom, 10)

                Image(item.imageName)
                    .resizable()
                    .frame(height: 280)
                    .frame(maxWidth: .infinity)

                HStack(alignment: .center) {
                    HStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundColor(.gray)
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text("모태환")
                                .gwangsanFont(style: .body3)

                            Text("첨단 1동")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 10)

                    Spacer()

                    Text("8단계")
                        .gwangsanFont(style: .body1)
                        .gwangsanColor(GwangsanAsset.Color.mainYellow500)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 6)

                Divider()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text(item.title)
                            .gwangsanFont(style: .titleSmall)

                        Text("\(item.point) 광산")
                            .gwangsanFont(style: .body3)

                        Text(item.content)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Button(action: {
                            isReportSheetPresented = true
                        }) {
                            Text("이 게시글 신고하기")
                                .font(.footnote)
                                .foregroundColor(.red)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.red)
                                        .offset(y: 2),
                                    alignment: .bottom
                                )
                        }
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }

                HStack(spacing: 12){
                    GwangsanButton(
                        text: "채팅하기",
                        fontSize: 14,
                        buttonState: true,
                        horizontalPadding: 0,
                        height: 52,
                        style: .outline,
                        destination: SwiftUIView()
                    )

                    GwangsanButton(
                        text: "거래완료",
                        fontSize: 14,
                        buttonState: true,
                        horizontalPadding: 0,
                        height: 52,
                        style: .filled,
                        action: {
                            isReviewSheetPresented = true
                        }
                    )
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 25)
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isReportSheetPresented) {
                ReportSheetView()
                    .presentationDetents([.fraction(0.8)])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $isReviewSheetPresented) {
                ReviewSheetView()
                    .presentationDetents([.fraction(0.8)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    ItemDetailView(
        item: CommonItem(
            id: UUID(),
            title: "집 청소좀 해주세요",
            point: 5000,
            category: .request,
            imageName: "TestImage1",
            content: "집 청소좀 해주세요집 청소 집 청소좀 해주세요집 청소집 청소좀 해주세요집 청소집 청소좀 해주세요집 청소집 청소좀 해주세요집 청소집 청소좀 해주세요집 청소집 청소좀 해주세요집 청소 집 청소좀 해주세요집 ",
            mode: .service
        )
    )
}
