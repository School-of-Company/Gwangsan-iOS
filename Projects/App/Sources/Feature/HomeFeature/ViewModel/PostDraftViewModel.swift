//
//  PostDraftViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI
import PhotosUI

class PostDraftViewModel: ObservableObject {
    @Published var topic: String = ""
    @Published var content: String = ""
    @Published var point: String = ""
    @Published var selectedImages: [UIImage] = [] // 이미지 서버통신

    @Published var mode: CommonItem.Mode = .service
    @Published var category: CommonItem.Category = .request

    func sumbit() {
        print("주제: \(topic)")
        print("내용: \(content)")
        print("광산: \(point)")
        print("모드: \(mode)")
        print("카테고리: \(category)")
    }
}
