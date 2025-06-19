//
//  NoticeView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct NoticeView: View {
    @StateObject private var viewModel = NoticeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("공지")
                    .gwangsanFont(style: .body1)
                VStack(alignment: .leading, spacing: 5){
                    Text("지점명 공지입니다")
                        .gwangsanFont(style: .titleMedium)
                    Text("본점")
                        .gwangsanFont(style: .body5)
                        .gwangsanColor(GwangsanAsset.Color.gray500)
                        .padding(.bottom, 20)
                    
                    List {
                        ForEach(viewModel.notices) { notice in
                            NavigationLink(destination: NoticeDetailView(notice: notice)) {
                                HStack{
                                    Image("Gwangsan")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(notice.title)
                                            .gwangsanFont(style: .body1)
                                        Text(notice.content)
                                            .gwangsanFont(style: .body5)
                                            .gwangsanColor(GwangsanAsset.Color.gray500)
                                            .lineLimit(1)
                                    }
                                    .padding(.vertical, 8)
                                }
                            }
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .padding(.horizontal, 24)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NoticeView()
}
