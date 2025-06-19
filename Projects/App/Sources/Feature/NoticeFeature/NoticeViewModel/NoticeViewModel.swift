//
//  NoticeViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/19/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

final class NoticeViewModel: ObservableObject {
    @Published var notices: [Notice] = [
        .init(id: UUID(),
              title: "당분간 거래중지입니다",
              content: "어떤어떤 이의 거래 중지 의사로 인해 요청사항응ㄹㅇㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㄹㅁㄴㅇㄹ")
    ]
}
