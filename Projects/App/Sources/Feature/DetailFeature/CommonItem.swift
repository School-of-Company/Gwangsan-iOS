//
//  CommonItem.swift
//  Gwangsan
//
//  Created by 박정우 on 5/20/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

struct CommonItem: Identifiable {
    enum Category: String {
        case request
        case provide
    }

    enum Mode {
        case item
        case service
    }

    let id = UUID()
    let title: String
    let point: Int
    let category: Category
    let imageName: String
    let mode: Mode
}
