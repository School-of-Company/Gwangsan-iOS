//
//  NoticeView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct NoticeView: View {
    @StateObject private var viewModel = NoticeViewModel()
    // 선택된 공지 항목을 보관할 상태
    @State private var selectedNotice: Notice?

    var body: some View {
        NavigationStack {
            VStack {
                Text("공지")
                    .gwangsanFont(style: .body1)

                VStack(alignment: .leading, spacing: 5) {
                    Text("지점명 공지입니다")
                        .gwangsanFont(style: .titleMedium)
                    Text("본점")
                        .gwangsanFont(style: .body5)
                        .gwangsanColor(GwangsanAsset.Color.gray500)
                        .padding(.bottom, 20)

                    List {
                        ForEach(viewModel.notices) { notice in
                            // 기본 NavigationLink이 아니라 PlainButtonStyle의 Button을 씁니다.
                            Button(action: {
                                selectedNotice = notice
                            }) {
                                HStack(spacing: 12) {
                                    Image("Gwangsan")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(notice.title)
                                            .gwangsanFont(style: .body1)
                                        Text(notice.content)
                                            .gwangsanFont(style: .body5)
                                            .gwangsanColor(GwangsanAsset.Color.gray500)
                                            .lineLimit(1)
                                    }
                                    .padding(.vertical, 8)
                                }
                            }
                            .buttonStyle(.plain)  // 버튼 기본 스타일 제거
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .padding(.horizontal, 24)
            // 숨은 NavigationLink: selectedNotice가 바뀌면 푸시
            .background(
                NavigationLink(
                    destination: Group {
                        if let notice = selectedNotice {
                            NoticeDetailView(notice: notice)
                                .padding(.horizontal, 24)
                        }
                    },
                    isActive: Binding(
                        get: { selectedNotice != nil },
                        set: { isActive in
                            if !isActive { selectedNotice = nil }
                        }
                    )
                ) {
                    EmptyView()
                }
                .hidden()
            )
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NoticeView()
}
