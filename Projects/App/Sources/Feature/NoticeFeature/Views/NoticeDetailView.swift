//
//  NoticeDetailView.swift
//  Gwangsan
//
//  Created by 박정우 on 6/19/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

extension String {
    
    var breakable: String {
        unicodeScalars.map { String($0) }.joined(separator: "\u{200B}")
    }
}

struct NoticeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let notice: Notice
    
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0) {
                ZStack{
                    Text("공지")
                        .gwangsanFont(style: .body1)
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .frame(width: 24, height: 24)
                                .gwangsanColor(GwangsanAsset.Color.gray500)
                            
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(notice.title)
                            .gwangsanFont(style: .titleMedium)
                        
                        Text("첨단 1동")
                            .gwangsanFont(style: .body3)
                        
                        Text(notice.content.breakable)
                            .gwangsanFont(style: .body4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                }
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
