//
//  ChatModel.swift
//  Gwangsan
//
//  Created by 박정우 on 5/1/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

struct ChatRoom: Identifiable {
    let id = UUID()
    let userName: String
    let lastMessage: String
    var unreadCount: Int
    var isRead: Bool { unreadCount == 0 }
}
