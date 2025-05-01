//
//  ChatViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 5/1/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

public final class ChatListViewModel: ObservableObject {
    @Published var chatRooms: [ChatRoom] = []

    init() {
        loadMockRooms()
    }

    func loadMockRooms() {
        chatRooms = [
            ChatRoom(userName: "김채팅", lastMessage: "새 메시지 도착!", unreadCount: 2),
            ChatRoom(userName: "박조용", lastMessage: "네 알겠습니다.", unreadCount: 0),
            ChatRoom(userName: "이채널", lastMessage: "잠시 후 연락드릴게요.", unreadCount: 3),
            ChatRoom(userName: "정답변", lastMessage: "감사합니다.", unreadCount: 0)
        ]
    }

    func fetchChatRoomsFromServer() {
        // API 호출 → self.chatRooms = 응답값
    }
}
