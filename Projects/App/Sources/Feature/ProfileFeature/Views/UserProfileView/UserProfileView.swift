//
//  UserProfileView.swift
//  Gwangsan
//
//  Created by 박정우 on 6/30/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    @State private var showingAlert = false
    @Environment(\.dismiss) private var dismiss
    
    // 후기 모델
    struct Review: Identifiable {
        let id = UUID()
        let imageName: String
        let reviewText: String
        let reviewerName: String
        let badgeImageName: String
        let progress: CGFloat
    }
    
    let sampleReviews: [Review] = [
        Review(imageName: "TestImage1", reviewText: "핸드폰 컬러가 마음에 들고\n상태도 매우 좋아요", reviewerName: "모태환", badgeImageName: "badge", progress: 0.7),
        Review(imageName: "TestImage2", reviewText: "핸드폰 컬러가 마음에 들고\n상태도 매우 좋아요", reviewerName: "모태환", badgeImageName: "badge", progress: 0.7)
    ]
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                Text("프로필")
                    .gwangsanFont(style: .body1)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 24, height: 24)
                        .gwangsanColor(GwangsanAsset.Color.gray500)
                }
            }
            .padding(.horizontal, 24)
            
            ScrollView {
                VStack(spacing: 0) {
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("모태환")
                            .gwangsanFont(style: .body1)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    
                    Rectangle()
                        .foregroundColor(GwangsanAsset.Color.gray100.swiftUIColor)
                        .frame(width: .infinity, height: 12)
                    
                    VStack(alignment: .leading) {
                        Text("밝기")
                            .gwangsanFont(style: .titleSmall)
                            .padding(.top, 40)
                        
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 20)
                            Capsule()
                                .fill(Color.yellow)
                                .frame(width: 270, height: 10)
                                .padding(.horizontal, 5)
                        }
                        .padding(.top, 24)
                        
                        HStack {
                            Spacer()
                            Text("8단계")
                                .font(.system(size: 12))
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.bottom, 30)
                    .padding(.horizontal, 24)
                    
                    Rectangle()
                        .foregroundColor(GwangsanAsset.Color.gray100.swiftUIColor)
                        .frame(width: .infinity, height: 12)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text("게시글")
                            .gwangsanFont(style: .titleSmall)
                            .padding(.top, 30)
                        
                        
                        GwangsanButton(
                            text: "게시글 보러가기",
                            fontSize: 14,
                            buttonState: true,
                            horizontalPadding: 0,
                            height: 52,
                            style: .outline,
                            destination: MyPostsView() // ID로 구별 하기
                        )   
                    }
                    .padding(.horizontal, 24)

                }
                .padding(.top, 24)
                .padding(.bottom, 40)
                
                Rectangle()
                    .foregroundColor(GwangsanAsset.Color.gray100.swiftUIColor)
                    .frame(width: .infinity, height: 12)
                
                VStack(alignment: .leading) {
                    Text("후기")
                        .gwangsanFont(style: .titleSmall)
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(sampleReviews) { review in
                        ReviewListItemView(
                            imageName: review.imageName,
                            progress: review.progress,
                            reviewText: review.reviewText,
                            reviewerName: review.reviewerName,
                            badgeImageName: review.badgeImageName
                        )
                    }
                }
                .padding(.top, 12)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}


private struct ReviewListItemView: View {
    let imageName: String
    let progress: CGFloat
    let reviewText: String
    let reviewerName: String
    let badgeImageName: String
    
    var body: some View {
        HStack(spacing: 40) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 12)
                        .frame(width: 120)
                    Capsule()
                        .fill(Color.yellow)
                        .frame(width: 120, height: 8)
                        .padding(.horizontal, 5)
                }
                Text(reviewText)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                
                HStack {
                    Text(reviewerName)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                    Spacer()
                    Image(badgeImageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
    }
}

#Preview{
    UserProfileView()
}
