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
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                Text("프로필")
                    .gwangsanFont(style: .body1)
                    .padding(.bottom, 24)
                
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
                .padding(.horizontal)
                .padding(.bottom, 16)
                
                Divider()
                
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
                
                Divider()
                    .padding(.horizontal, -24)
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("내 활동")
                        .gwangsanFont(style: .titleSmall)
                        .padding(.top, 20)
                    
                    HStack(spacing: 20) {
                        GwangsanButton(
                            text: "내 글",
                            fontSize: 14,
                            buttonState: true,
                            horizontalPadding: 0,
                            height: 52,
                            style: .outline,
                            destination: MyPostsView()
                        ).frame(width: 107)
                        
                        GwangsanButton(
                            text: "거래내역",
                            fontSize: 14,
                            buttonState: true,
                            horizontalPadding: 0,
                            height: 52,
                            style: .outline,
                            destination: TradeLogView()
                        ).frame(width: 107)
                        
                        GwangsanButton(
                            text: "내가 작성한 후기",
                            fontSize: 14,
                            buttonState: true,
                            horizontalPadding: 0,
                            height: 52,
                            style: .outline,
                            destination: MyReviewsView()
                        ).frame(width: 107)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
