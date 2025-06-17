//
//  StartView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @ObservedObject var loginviewModel: LoginViewModel
    @State private var currentPage = 0

    let images = ["StartView1", "StartView2", "StartView3"]

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom) {
                    TabView(selection: $currentPage) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFill()
                                .frame(height: 570)
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.bottom, 40)
                    
                    HStack(spacing: 6) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Circle()
                                .fill(index == currentPage ? GwangsanAsset.Color.mainGreen500.swiftUIColor : Color.gray.opacity(0.3))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.bottom, 10)
                }

                Spacer()

                VStack(spacing: 12) {
                    NavigationLink(destination: NameInputView(viewModel: viewModel)) {
                        Text("회원가입")
                            .gwangsanFont(style: .body1)
                            .font(.system(size: 18))
                            .gwangsanColor(GwangsanAsset.Color.mainGreen500)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(GwangsanAsset.Color.mainGreen500.swiftUIColor, lineWidth: 1)
                            )
                            .cornerRadius(12)
                    }

                    NavigationLink(destination: AliasInputView(viewModel: loginviewModel)) {
                        Text("로그인")
                            .gwangsanFont(style: .body1)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(GwangsanAsset.Color.mainGreen500.swiftUIColor)
                            )
                    }
                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    StartView(viewModel: SignUpViewModel(), loginviewModel: LoginViewModel())
}
