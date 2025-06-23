//
//  NoticeModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/19/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

struct Notice: Identifiable {
    var id = UUID()
    let title: String
    let content: String
    
    init(id: UUID = UUID(), title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}
