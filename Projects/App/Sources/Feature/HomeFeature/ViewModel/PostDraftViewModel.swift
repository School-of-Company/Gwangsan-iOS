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
    @Published var selectedImages: [UIImage] = []
    
    func sumbit() {
        print("\(topic)")
        print("\(content)")
        print("\(point)")
    }
}
