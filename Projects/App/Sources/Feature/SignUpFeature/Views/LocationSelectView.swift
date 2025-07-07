//
//  LocationSelectView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/24/25.
//

import SwiftUI

struct LocationSelectView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var keyword: String = ""
    @State private var showError: Bool = false

    private let allLocations = ["첨단 1동", "첨단 2동", "첨단 3동", "운암동", "풍암동", "쌍촌동"]

    private var filteredLocations: [String] {
        guard !keyword.isEmpty else { return [] }
        return allLocations.filter { $0.contains(keyword) }
    }

    var body: some View {
        VStack(spacing: 0) {
            // 헤더
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("회원가입")
                        .gwangsanFont(style: .titleMedium)
                    Text("동네를 선택해주세요")
                        .gwangsanFont(style: .label)
                        .gwangsanColor(GwangsanAsset.Color.gray500)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)

                // 검색 필드
                GwangsanTextField(
                    "동네를 검색해주세요",
                    text: $keyword,
                    title: "",
                    horizontalPadding: 24,
                    isError: $showError
                )
                .overlay(
                    Image("Search")
                        .padding(.top, 17)
                        .padding(.trailing, 35),
                    alignment: .trailing
                )
                .padding(.vertical, 20)
            }
            .padding(.top, 16)

            Divider()
                .padding(.horizontal, 24)

            // 결과 리스트
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(filteredLocations, id: \.self) { location in
                        Button {
                            viewModel.selectedLocation = location
                            keyword = location
                        } label: {
                            HStack {
                                Text(location)
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.vertical, 34)
                            .padding(.horizontal, 24)
                            .background(Color.white)
                        }
                        Divider()
                            .padding(.horizontal, 24)
                    }
                }
            }

            Spacer()

            // 다음 버튼 (push)
            GwangsanButton(
                text: "다음",
                buttonState: !viewModel.selectedLocation.isEmpty,
                horizontalPadding: 24,
                height: 52,
                style: .filled,
                destination: BranchSelectView(viewModel: viewModel)
            )
            .padding(.bottom, 30)
        }
        .modifier(BackButtonModifier())    // 한 단계 pop
    }
}

#Preview {
    NavigationStack {
        LocationSelectView(viewModel: SignUpViewModel())
    }
}
