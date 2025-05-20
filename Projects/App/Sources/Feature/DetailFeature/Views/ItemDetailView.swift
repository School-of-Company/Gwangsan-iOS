//
//  ItemDetailVeiw.swift
//  Gwangsan
//
//  Created by 박정우 on 5/20/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    let item: CommonItem

    var categoryText: String {
        item.category.displayName(for: item.mode)
    }

    var body: some View {
        VStack(spacing: 24) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(12)

            Text(item.title)
                .font(.title2)
                .fontWeight(.bold)

            Text("\(item.point) 광산")
                .font(.body)
                .foregroundColor(.gray)

            Text("카테고리: \(categoryText)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle(categoryText)
    }
}
