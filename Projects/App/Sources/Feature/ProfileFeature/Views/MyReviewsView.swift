//
//  MyReviewsView.swift
//  Gwangsan
//
//  Created by 박정우 on 5/13/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MyReviews: Identifiable {
    let id: UUID = UUID()
    let imageName: String
    let title: String
    let description: String
}
struct MyReviewsView: View {
    @Environment(\.dismiss) private var dismiss
    
    let reviewItems: [MyReviews] = [
            MyReviews(imageName: "TestImage1", title: "바퀴벌레 좀 잡아주세요", description: "바퀴벌레 잘잡아줘서 좋았어요.."),
            MyReviews(imageName: "TestImage2", title: "집 청소좀 해주세요", description: "청소 된 집이 너무 깨끗해요.."),
            MyReviews(imageName: "TestImage3", title: "자전거 팔아요", description: "자전거 상태가 별로 안좋아요 ㅠㅠ")
    ]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                ZStack {
                    Text("내가 작성한 후기")
                        .gwangsanFont(style: .body1)
                    
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 24, height: 24)
                                .gwangsanColor(GwangsanAsset.Color.gray500)
                        }
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(reviewItems) { item in
                            HStack(alignment: .center, spacing: 24) {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipped()
                                    .cornerRadius(8)

                                VStack(alignment: .leading, spacing: 12) {
                                    Text(item.title)
                                        .gwangsanFont(style: .body3)

                                    Text(item.description)
                                        .font(.system(size: 14))
                                }

                                Spacer()
                            }
                            .padding(.vertical, 16)
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MyReviewsView()
}
