//
//  PostCreateStep3View.swift
//  Gwangsan
//
//  Created by 박정우 on 6/6/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct PostCreateStep3View: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused: Bool
    @ObservedObject var viewModel: PostDraftViewModel
    @State private var navigateToStep1 = false
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                HStack {
                    Image("Back")
                    Spacer()
                    Text("필요해요")
                        .gwangsanFont(style: .body1)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image("Close")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            .padding(.horizontal, 24)
            
            ProgressBar(currentStep: 3)
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("다시 한번 확인해주세요.")
                            .gwangsanFont(style: .titleSmall)
                            .padding(.top, 10)
                        
                        GwangsanTextField(
                            "이름을 입력해주세요",
                            text: $viewModel.topic,
                            title: "주제",
                            horizontalPadding: 0,
                            isError: $showError,
                            onSubmit: {
                                showError = viewModel.topic.isEmpty
                            }
                        )
                        .padding(.top, 30)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("내용")
                                .gwangsanFont(style: .label)
                            
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $viewModel.content)
                                    .font(.system(size: 14))
                                    .frame(height: 185)
                                    .padding(8)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(
                                                isFocused
                                                ? GwangsanAsset.Color.mainYellow500.swiftUIColor
                                                : GwangsanAsset.Color.gray400.swiftUIColor,
                                                lineWidth: 2
                                            )
                                    )
                                    .cornerRadius(8)
                                    .focused($isFocused)
                                
                                if viewModel.content.isEmpty {
                                    Text("내용을 작성해주세요")
                                        .font(.system(size: 14))
                                        .gwangsanColor(GwangsanAsset.Color.gray400)
                                        .padding(14)
                                }
                            }
                        }
                        .padding(.top, 25)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("사진첨부")
                                .gwangsanFont(style: .label)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(viewModel.selectedImages, id: \.self) { image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 64, height: 64)
                                            .clipShape(Circle())
                                    }
                                }
                            }
                        }
                        .padding(.top, 10)
                        
                        GwangsanTextField(
                            "광산을 입력해주세요",
                            text: $viewModel.point,
                            title: "광산",
                            horizontalPadding: 0,
                            isError: $showError,
                            onSubmit: {
                                showError = viewModel.point.isEmpty
                            }
                        )
                        .padding(.top, 30)
                        
                        HStack(spacing: 12) {
                            NavigationLink(destination: PostCreateStep1View(
                                headerTitle: "필요해요",
                                viewModel: viewModel
                            ), isActive: $navigateToStep1) {
                                EmptyView()
                            }.hidden()
                            
                            GwangsanButton(
                                text: "수정",
                                buttonState: true,
                                horizontalPadding: 0,
                                height: 52,
                                style: .outline
                            ) {
                                navigateToStep1 = true
                            }
                            
                            GwangsanButton(
                                text: "완료",
                                buttonState: true,
                                horizontalPadding: 0,
                                height: 52,
                                style: .filled,
                                action: {
                                    viewModel.sumbit()
                                }
                            )
                        }
                        .padding(.top, 60)
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
