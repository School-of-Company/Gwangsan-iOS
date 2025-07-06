//
//  AuthService.swift
//  Gwangsan
//
//  Created by 박정우 on 7/3/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Moya

struct SignupRequest: Encodable {
    let name: String
    let nickname: String
    let password: String
    let phoneNumber: String
    let dongName: String
    let placeName: String
    let recommender: String
    let specialties: [String]
}

enum AuthService {
    /// 회원가입
    case signup(request: SignupRequest)
    // 로그인, 로그아웃, 토큰 재발급 등은 이후에 추가
}

extension AuthService: TargetType {
    public var baseURL: URL {
          return URL(string: "https://gwangsan.kro.kr")!
    }

    var path: String {
        switch self {
        case .signup:
            return "/api/auth/signup"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signup:
            return .post
        }
    }

    var sampleData: Data { Data() } 

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var task: Task {
        switch self {
        case let .signup(request):
            return .requestJSONEncodable(request)
        }
    }
}
