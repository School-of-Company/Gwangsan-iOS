//
//  AuthService.swift
//  Gwangsan
//
//  Created by 박정우 on 7/3/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Moya

public struct SignupRequest: Encodable {
    let name: String
    let nickname: String
    let password: String
    let phoneNumber: String
    let dongName: String
    let placeName: String
    let recommender: String
    let specialties: [String]
}

public enum OSType: String, Encodable {
    case android = "ANDROID"
    case ios     = "IOS"
}

public struct LoginRequest: Encodable {
    let nickname: String
    let password: String
    let deviceToken: String
    let deviceId: String
    let osType: OSType
}

public struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpiresIn: String
    let refreshTokenExpiresIn: String
}

public enum AuthService {
    case signup(request: SignupRequest)
    case login(request: LoginRequest)
}

extension AuthService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://gwangsan.io.kr")!
    }

    public var path: String {
        switch self {
        case .signup:
            return "/api/auth/signup"
        case .login:
            return "/api/auth/signin"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .signup, .login:
            return .post
        }
    }

    public var sampleData: Data {
        switch self {
        case .signup:
            // 성공 시 201 Created, 보통 빈 바디이므로 빈 Data
            return Data()
        case .login:
            // 예시 JSON
            let example = """
            {
              "accessToken": "exampleAccessToken",
              "refreshToken": "exampleRefreshToken",
              "accessTokenExpiresIn": "3600",
              "refreshTokenExpiresIn": "86400"
            }
            """
            return Data(example.utf8)
        }
    }

    public var headers: [String: String]? {
        switch self {
        case .signup, .login:
            return ["Content-Type": "application/json"]
        }
    }

    public var task: Task {
        switch self {
        case let .signup(request):
            return .requestJSONEncodable(request)
        case let .login(request):
            return .requestJSONEncodable(request)
        }
    }
}
