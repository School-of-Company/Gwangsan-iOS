//
//  CustomSliderView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/31/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var value: Double
    var range: ClosedRange<Double> = 0...1

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                Capsule()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 8)
                
                Capsule()
                    .fill(Color.orange)
                    .frame(width: CGFloat(value) * geometry.size.width, height: 8)

                Circle()
                    .strokeBorder(Color.orange, lineWidth: 2)
                    .background(Circle().fill(Color.white))
                    .frame(width: 24, height: 24)
                    .offset(x: CGFloat(value) * geometry.size.width - 12)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let newValue = gesture.location.x / geometry.size.width
                                value = min(max(range.lowerBound, newValue), range.upperBound)
                            }
                    )
            }
        }
        .frame(height: 30)
    }
}
