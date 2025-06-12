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
    @State private var customInput: String = ""
    @State private var isDropdownOpen: Bool = false
    @FocusState private var isTextFieldFocused: Bool

    private let allMajors = [
        "청소하기", "운전하기", "달리기",
        "빨래하기", "벌레잡기", "이삿짐 나르기"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                if isDropdownOpen {
                    Color(.systemGray5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isDropdownOpen = false
                                isTextFieldFocused = false
                            }
                        }
                }

                VStack(spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("회원가입")
                            .gwangsanFont(style: .titleMedium)
                        Text("자신을 소개하는 글을 작성해주세요")
                            .gwangsanFont(style: .label)
                            .gwangsanColor(GwangsanAsset.Color.gray500)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)

                    // 입력 필드 + 드롭다운
                    fieldAndDropdown
                        .zIndex(1)

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
        }
    }

    private var fieldAndDropdown: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("특기")
                .gwangsanFont(style: .label)
                .padding(.horizontal, 24)

            // TextField 영역
            ZStack(alignment: .leading) {
                if customInput.isEmpty && viewModel.selectedMajors.isEmpty {
                    HStack(spacing: 8) {
                        Image("Plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("특기 추가")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                }

                TextField("", text: $customInput) { _ in
                    withAnimation { isDropdownOpen = true }
                }
                .focused($isTextFieldFocused)
                .padding(.vertical, 14)
                .padding(.horizontal, 24)
                .onChange(of: customInput) { newValue in
                    if newValue.isEmpty {
                        viewModel.selectedMajors = []
                    } else {
                        viewModel.selectedMajors = [newValue]
                    }
                }
            }
            .frame(height: 52)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isDropdownOpen
                            ? GwangsanAsset.Color.mainYellow400.swiftUIColor
                            : Color.black,
                        lineWidth: 1
                    )
            )
            .padding(.horizontal, 24)
            .onSubmit {
                let trimmed = customInput.trimmingCharacters(in: .whitespaces)
                guard !trimmed.isEmpty,
                      !viewModel.selectedMajors.contains(trimmed)
                else { return }
                viewModel.selectedMajors.append(trimmed)
                customInput = viewModel.selectedMajors.joined(separator: ", ")
                DispatchQueue.main.async { isTextFieldFocused = true }
            }

            if isDropdownOpen {
                VStack(spacing: 0) {
                    Spacer().frame(height: 5)
                    ForEach(allMajors, id: \.self) { major in
                        dropdownItem(for: major)
                    }
                    Spacer().frame(height: 5)
                }
                .padding(.horizontal, 5)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding(.horizontal, 24)
                .padding(.top, 4)
            }
        }
        .padding(.top, 30)
    }

    private func dropdownItem(for major: String) -> some View {
        let isSelected = viewModel.selectedMajors.contains(major)
        return HStack(spacing: 8) {
            if isSelected {
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
                .foregroundColor(isSelected ? .blue : .black)
                .font(.system(size: 14))

            Spacer()
        }
        .frame(height: 36)
        .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: isSelected ? 12 : 0))
        .onTapGesture {
            withAnimation {
                if let idx = viewModel.selectedMajors.firstIndex(of: major) {
                    viewModel.selectedMajors.remove(at: idx)
                } else {
                    viewModel.selectedMajors.append(major)
                }
                customInput = viewModel.selectedMajors.joined(separator: ", ")
                DispatchQueue.main.async { isTextFieldFocused = true }
            }
        }
    }
}

#Preview {
    MajorSelectView(viewModel: SignUpViewModel())
}
