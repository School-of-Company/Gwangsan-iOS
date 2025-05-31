//
//  CommonItemModel.swift
//  Gwangsan
//
//  Created by 박정우 on 5/20/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

struct CommonItem: Identifiable {
    enum Mode {
        case item, service
    }

    enum Category: CaseIterable {
        case request, provide

        func displayName(for mode: Mode) -> String {
            switch (mode, self) {
            case (.item, .request): return "필요해요"
            case (.item, .provide): return "팔아요"
            case (.service, .request): return "해주세요"
            case (.service, .provide): return "할수있어요"
            }
        }
    }

    let id: UUID
    let title: String
    let point: Int
    let category: Category
    let imageName: String
    let content: String
    let mode: Mode
}
