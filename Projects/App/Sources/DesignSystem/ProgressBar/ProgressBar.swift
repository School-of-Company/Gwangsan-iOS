//
//  ProgressBar.swift
//  Gwangsan
//
//  Created by 박정우 on 6/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    let currentStep: Int
    let totalSteps: Int = 3

    var progress: CGFloat {
        CGFloat(currentStep) / CGFloat(totalSteps)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                Rectangle()
                    .fill(GwangsanAsset.Color.mainBlue300.swiftUIColor)
                    .frame(width: geometry.size.width * progress, height: 8)
                    .animation(.easeInOut(duration: 0.3), value: currentStep)
            }
        }
        .frame(height: 8)
    }
}
