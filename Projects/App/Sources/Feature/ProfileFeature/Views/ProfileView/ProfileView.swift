//
//  ProfileView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingAlert = false
    
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
            Text("프로필")
                .gwangsanFont(style: .body1)
                .padding(.bottom, 24)
            ScrollView {
                VStack(spacing: 0) {
                    
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("모태환")
                                .gwangsanFont(style: .body1)
                            Button {
                                showingAlert = true
                            } label: {
                                HStack(spacing: 12) {
                                    Text("로그아웃하기")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14))
                                    Image("arrow-down")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .alert("로그아웃", isPresented: $showingAlert) {
                            Button("취소", role: .cancel) { }
                            Button("로그아웃", role: .destructive) {
                                // 로그아웃 처리 로직
                            }
                        } message: {
                            Text("정말 로그아웃 하시겠어요?")
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: ModifyProfileView()) {
                            Text("내 정보 수정")
                                .font(.system(size: 14))
                                .gwangsanColor(GwangsanAsset.Color.mainGreen500)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(GwangsanAsset.Color.mainGreen500.swiftUIColor, lineWidth: 1)
                                )
                        }
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
                        
                        Text("광산")
                            .gwangsanFont(style: .titleSmall)
                            .foregroundColor(.black)
                            .padding(.top, 12)
                        
                        HStack {
                            Image("Gold")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 57, height: 52)
                                .clipped()
                            
                            Spacer().frame(width: 46)
                            
                            Text("5000 광산")
                                .font(.system(size: 26))
                                .bold()
                                .gwangsanColor(GwangsanAsset.Color.mainYellow700)
                        }
                        .frame(height: 95)
                        .frame(maxWidth: .infinity)
                        .background(GwangsanAsset.Color.gray200.swiftUIColor)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top, 24)
                        .padding(.bottom, 52)
                    }
                    .padding(.horizontal, 24)
                    
                    Rectangle()
                        .foregroundColor(GwangsanAsset.Color.gray100.swiftUIColor)
                        .frame(width: .infinity, height: 12)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text("내 활동")
                            .gwangsanFont(style: .titleSmall)
                            .padding(.top, 10)
                        
                        HStack(spacing: 20) {
                            GwangsanButton(
                                text: "내 글",
                                fontSize: 14,
                                buttonState: true,
                                horizontalPadding: 0,
                                height: 52,
                                style: .outline,
                                destination: MyPostsView()
                            )
                            
                            GwangsanButton(
                                text: "거래내역",
                                fontSize: 14,
                                buttonState: true,
                                horizontalPadding: 0,
                                height: 52,
                                style: .outline,
                                destination: TradeLogView()
                            )
                            
                            GwangsanButton(
                                text: "내가 작성한 후기",
                                fontSize: 14,
                                buttonState: true,
                                horizontalPadding: 0,
                                height: 52,
                                style: .outline,
                                destination: MyReviewsView()
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 50)
                    
                    Rectangle()
                        .foregroundColor(GwangsanAsset.Color.gray100.swiftUIColor)
                        .frame(width: .infinity, height: 12)
                    
                    VStack(alignment: .leading) {
                        Text("내 후기")
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
        }
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
    ProfileView()
}
