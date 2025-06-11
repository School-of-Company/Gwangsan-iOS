//
//  MajorSelectView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/26/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MajorSelectView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    @State private var isDropdownOpen: Bool = false
    
    private let allMajors = ["청소하기", "운전하기", "달리기", "빨래하기", "벌레잡기", "이삿짐 나르기"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                mainContent
                
                if isDropdownOpen {
                    overlayBackground
                }
                
                if isDropdownOpen {
                    dropdownMenu
                }
            }
        }
    }
    
    private var mainContent: some View {
        VStack(spacing: 0) {
            VStack(spacing: 54) {
                headerSection
                
                selectSection
            }
            .padding(.top, 16)
            
            Spacer()
            
            GwangsanButton(
                text: "다음",
                buttonState: !viewModel.selectedMajors.isEmpty,
                horizontalPadding: 24,
                height: 52,
                destination: ReferenceView(viewModel: viewModel)
            )
            .padding(.bottom, 30)
        }
        .modifier(BackButtonModifier())
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("회원가입")
                .gwangsanFont(style: .titleMedium)
            
            Text("자신을 소개하는 글을 작성해주세요")
                .gwangsanFont(style: .label)
                .gwangsanColor(GwangsanAsset.Color.gray500)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
    }
    
    private var selectSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("전공")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.horizontal, 24)
            
            HStack(spacing: 8) {
                if viewModel.selectedMajors.isEmpty {
                    Image("Plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Text(viewModel.selectedMajors.isEmpty ? "소개추가" : viewModel.selectedMajors.joined(separator: ", "))
                    .foregroundColor(viewModel.selectedMajors.isEmpty ? .gray : .black)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 52)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isDropdownOpen
                        ? GwangsanAsset.Color.mainYellow400.swiftUIColor
                        : Color.black,
                        lineWidth: 1
                    )
            )
            .padding(.horizontal, 24)
            .onTapGesture {
                withAnimation {
                    isDropdownOpen.toggle()
                }
            }
        }
    }
    
    private var overlayBackground: some View {
        Color.black.opacity(0.3)
            .ignoresSafeArea()
            .onTapGesture {
                withAnimation {
                    isDropdownOpen = false
                }
            }
    }
    
    private var dropdownMenu: some View {
        VStack {
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.26)
            VStack(spacing: 0) {
                Spacer().frame(height: 8)
                
                VStack(spacing: 0) {
                    ForEach(allMajors, id: \.self) { major in
                        dropdownItem(for: major)
                    }
                }
                
                Spacer().frame(height: 8)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 1)
            .padding(.horizontal, 24)
            
            Spacer()
        }
    }
    
    private func dropdownItem(for major: String) -> some View {
        HStack(spacing: 8) {
            if viewModel.selectedMajors.contains(major) {
                Image("Check")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(.leading, 8)
            } else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 16, height: 16)
            }
            
            Text(major)
                .foregroundColor(.black)
                .font(.system(size: 14))
            
            Spacer()
        }
        .frame(height: 36)
        .frame(maxWidth: .infinity)
        .background(
            viewModel.selectedMajors.contains(major)
            ? GwangsanAsset.Color.selectColor.swiftUIColor
            : Color.clear
        )
        .clipShape(
            RoundedRectangle(cornerRadius: viewModel.selectedMajors.contains(major) ? 12 : 0)
        )
        .padding(.horizontal, viewModel.selectedMajors.contains(major) ? 8 : 0)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                if let index = viewModel.selectedMajors.firstIndex(of: major) {
                    viewModel.selectedMajors.remove(at: index)
                } else {
                    viewModel.selectedMajors.append(major)
                }
            }
        }
    }
}

#Preview {
    MajorSelectView()
}
