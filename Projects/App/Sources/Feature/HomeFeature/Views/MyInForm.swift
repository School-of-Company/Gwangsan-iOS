//
//  MyInForm.swift
//  Gwangsan
//
//  Created by 박정우 on 6/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MyInForm: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        Text("알림")
                            .gwangsanFont(style: .body1)
                        Spacer()
                        Button(action: { dismiss() }) {
                            Image("Close")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center, spacing: 24) {
                        Image("TestImage1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("고양이고양이")
                                .gwangsanFont(style: .body3)
                                .foregroundColor(.black)
                            Text("거래가 완료되었습니다.")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 16)
                }

                Spacer()
                
            }
            .padding(.horizontal, 24)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MyInForm()
}
