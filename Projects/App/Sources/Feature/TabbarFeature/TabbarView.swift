//
//   MainTabView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: TabType = .home
    
    enum TabType: CaseIterable {
        case home, post, chat, notice, profile

        var title: String {
            switch self {
            case .home: return "홈"
            case .post: return "게시글"
            case .chat: return "채팅"
            case .notice: return "공지"
            case .profile: return "프로필"
            }
        }

        var imageName: String {
            switch self {
            case .home: return "Home"
            case .post: return "Post"
            case .chat: return "Chat"
            case .notice: return "Horn"
            case .profile: return "Person"
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            contentView(for: selectedTab)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            Divider()
            HStack(spacing: 40) {
                ForEach(TabType.allCases, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack {
                            Image(tab.imageName)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text(tab.title)
                                .font(.system(size: 14))
                        }
                        .foregroundColor(
                            selectedTab == tab
                            ? GwangsanAsset.Color.mainGreen500.swiftUIColor
                            : .gray
                        )
                    }
                }
            }
            .padding(.top, 12)
        }
    }

    @ViewBuilder
    private func contentView(for tab: TabType) -> some View {
        switch tab {
        case .home: MainView()
        case .post: PostView()
        case .chat: ChatListView()
        case .notice: NoticeView()
        case .profile: ProfileView()
        }
    }
}

#Preview {
    TabbarView()
}
