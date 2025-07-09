//
//  LoginViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/14/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Moya
import UIKit

class LoginViewModel: ObservableObject {
    // MARK: — Input
    @Published var nickname: String = ""
    @Published var password: String = ""
    
    // MARK: — Networking
    private let provider = MoyaProvider<AuthService>()
    
    /// 로그인 요청
    func login() {
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        let deviceToken = "" // FCM 토큰 등 필요시 할당
        let osType: OSType = .ios // ✅ enum 직접 사용
        
        let loginrequest = LoginRequest(
            nickname: nickname,
            password: password,
            deviceToken: deviceToken,
            deviceId: deviceId,
            osType: osType
        )
        
        provider.request(.login(loginrequest: loginrequest)) { result in
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 200:
                    do {
                        let loginResp = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                        print("✅ 로그인 성공")
                        print("액세스 토큰:", loginResp.accessToken)
                        print("리프레시 토큰:", loginResp.refreshToken)
                    } catch {
                        print("❌ 응답 디코딩 실패:", error)
                    }
                case 400:
                    print("400 Bad Request: 요청 형식 오류")
                case 401:
                    print("401 Unauthorized: 로그인 정보 불일치")
                case 403:
                    print("403 Forbidden: 접근 제한된 계정")
                default:
                    print("⚠️ 알 수 없는 상태 코드:", response.statusCode)
                }
            case .failure(let error):
                print("🛑 네트워크 오류:", error.localizedDescription)
            }
        }
    }
}
