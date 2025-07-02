//
//  SignUpViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//
// SignUpViewModel.swift
import SwiftUI

// SignUpViewModel.swift
import SwiftUI
import Moya

class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var password: String = ""
    @Published var phoneNumber: String = ""        // ← 추가
    @Published var selectedLocation: String = ""
    @Published var branch: String = ""
    @Published var selectedMajors: [String] = []
    @Published var reference: String = ""

    // Moya provider 예시
    private let provider = MoyaProvider<AuthService>()

    func submit() {
        let req = SignupRequest(
            name: name,
            nickname: nickname,
            password: password,
            phoneNumber: phoneNumber,          // ← 여기에 인증된 번호가 들어갑니다
            dongName: selectedLocation,
            placeName: branch,
            recommender: reference,
            specialties: selectedMajors
        )

//        provider.request(.signup(request: req)) { response in
//            // ...성공/실패 처리...
//        }
    }
}
