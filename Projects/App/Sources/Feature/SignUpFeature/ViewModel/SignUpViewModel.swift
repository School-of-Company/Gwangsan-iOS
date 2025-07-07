//
//  SignUpViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Moya

class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var password: String = ""
    @Published var phoneNumber: String = ""
    @Published var selectedLocation: String = ""
    @Published var branch: String = ""
    @Published var selectedMajors: [String] = []
    @Published var reference: String = ""

    private let provider = MoyaProvider<AuthService>()
    
    var isNameValid: Bool {
        let pattern = "^[가-힣]{2,}$"
        return name.range(of: pattern, options: .regularExpression) != nil
    }

    func submit() {
        let request = SignupRequest(
            name: name,
            nickname: nickname,
            password: password,
            phoneNumber: phoneNumber,
            dongName: selectedLocation,
            placeName: branch,
            recommender: reference,
            specialties: selectedMajors
        )

        provider.request(.signup(request: request)) { result in
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 201:
                    print("회원가입 성공 (201)")
                case 400:
                    print("회원가입 실패: 필수 항목 누락 또는 형식 오류 (400 Bad Request)")
                case 401:
                    print("회원가입 실패: 인증 코드가 유효하지 않습니다. (401 Unauthorized)")
                case 409:
                    print("회원가입 실패: 중복된 닉네임 또는 전화번호입니다. (409 Conflict)")
                default:
                    print("⚠️ 예상치 못한 상태 코드: \(response.statusCode)")
                }

            case .failure(let error):
                print("🚨 네트워크 오류: \(error.localizedDescription)")
            }
        }
    }
}
