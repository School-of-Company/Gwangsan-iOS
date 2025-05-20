//
//  ItemDetailView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/19/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

enum CommonItemMode {
    case item, service
}

enum CommonItemCategory: String, CaseIterable {
    case request = "요청"
    case provide = "제공"
}

struct CommonItem: Identifiable {
    let id = UUID()
    let title: String
    let point: Int
    let category: CommonItemCategory
    let imageName: String
}

