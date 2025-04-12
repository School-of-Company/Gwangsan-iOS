//
//  DesignModifire.swift
//  Gwangsan
//
//  Created by 박정우 on 4/10/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

typealias GwangsanFont = GwangsanFontFamily.Pretendard
typealias GwangsanColor = GwangsanColors.Color

enum GwangsanFontStyle {
    case titleLarge, titleMedium, titleSmall
    case body1, body2, body3, body4, body5
    case label, caption

    var fontConfig: (size: CGFloat, weight: UIFont.Weight, lineHeight: CGFloat) {
        switch self {
        case .titleLarge: return (30, .semibold, 1.2)
        case .titleMedium: return (26, .semibold, 1.2)
        case .titleSmall: return (20, .semibold, 1.3)
        case .body1: return (18, .semibold, 1.4)
        case .body2: return (18, .regular, 1.4)
        case .body3: return (16, .semibold, 1.4)
        case .body4: return (16, .regular, 1.4)
        case .body5: return (14, .regular, 1.4)
        case .label: return (14, .medium, 1.4)
        case .caption: return (12, .regular, 1.4)
        }
    }

    var uiFont: UIFont {
        let config = fontConfig
        return UIFont.systemFont(ofSize: config.size, weight: config.weight)
    }

    var font: Font {
        Font(uiFont)
    }

    var lineHeight: CGFloat {
        let config = fontConfig
        return config.size * config.lineHeight
    }
}

extension View {
    func gwangsanFont( style: GwangsanFontStyle) -> some View {
        let lineSpacing = style.lineHeight - style.fontConfig.size
        return self
            .font(style.font)
            .lineSpacing(lineSpacing)
            .padding(.vertical, lineSpacing / 2)
    }
    
    func gwangsanColor(_ color: GwangsanColors) -> some View {
           self.foregroundColor(color.swiftUIColor)
       }

    func gwangsanBackground(_ color: GwangsanColors) -> some View {
              self.background(color.swiftUIColor)
      }
}
