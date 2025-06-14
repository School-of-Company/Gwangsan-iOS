//
//  PhoneVerificationViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/9/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//
import SwiftUI
import Foundation
import Combine

final class PhoneVerificationViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var verificationCode: String = ""
    @Published var isCodeSent: Bool = false
    @Published var errorMessage: String?

    func sendCode() {
        // 유효성 검사
        guard phoneNumber.count == 11 else {
            errorMessage = "올바른 번호를 입력해주세요"
            return
        }
//        API 호출 예시
//        MyAPI.requestSendSMS(to: phoneNumber) { success in
//            DispatchQueue.main.async {
//                if success {
//                    self.isCodeSent = true
//                    self.errorMessage = nil
//                } else {
//                    self.errorMessage = "인증번호 전송에 실패했습니다"
//                }
//            }
//        }
    }
    // 전화번호코드 인증번호 검사
    func verifyCode() {
        guard verificationCode.count == 6 else {
            errorMessage = "6자리 코드를 입력해주세요"
            return
        }

        // 코드 검증 요청 예시 API
//        MyAPI.verifySMS(code: verificationCode, phone: phoneNumber) { valid in
//            DispatchQueue.main.async {
//                if valid {
//                    self.errorMessage = nil
//                    // TODO: 다음 단계로 이동
//                } else {
//                    self.errorMessage = "인증번호가 일치하지 않습니다"
//                }
//            }
//        }
    }
}

