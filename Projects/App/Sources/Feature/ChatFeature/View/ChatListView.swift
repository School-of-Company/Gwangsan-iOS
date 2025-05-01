//
//  ChatView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // 상단 타이틀
                HStack {
                    Text("채팅")
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                .padding(.bottom, 8)

                Divider()

                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(viewModel.chatRooms) { room in
                            NavigationLink(destination: ChatRoomView(userName: room.userName)) {
                                chatRoomRow(for: room)
                            }
                        }

                        Spacer(minLength: 0)
                    }
                    .padding(.top, 16)
                }

                Divider()
            }
        }
    }

    @ViewBuilder
    private func chatRoomRow(for room: ChatRoom) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(room.isRead ? .gray.opacity(0.3) : .black)

            VStack(alignment: .leading, spacing: 4) {
                Text(room.userName)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(room.isRead ? .gray : .black)

                Text(room.lastMessage)
                    .font(.system(size: 13))
                    .foregroundColor(room.isRead ? .gray : .black)
            }

            Spacer()

            if room.unreadCount > 0 {
                Text("\(room.unreadCount)")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .background(Color.orange)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChatListView()
}
