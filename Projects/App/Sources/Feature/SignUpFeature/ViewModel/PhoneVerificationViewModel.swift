//
//  PhoneVerificationViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/9/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Combine

final class PhoneVerificationViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var verificationCode: String = ""
    @Published var isCodeSent: Bool = false
    @Published var errorMessage: String?

    /// SMS 인증번호 전송 요청
    func sendCode() {
        // *올바른 국내 휴대폰 번호(예: 01012345678) 길이 검사*
        guard phoneNumber.count == 11, phoneNumber.hasPrefix("010") else {
            errorMessage = "올바른 번호를 입력해주세요"
            isCodeSent = false
            return
        }
        // 실제 API 호출 자리에…
        // MyAPI.requestSendSMS(to: phoneNumber) { success in … }

        // 여기서는 성공했다고 가정
        isCodeSent = true
        errorMessage = nil
    }

    /// 인증번호 검증 요청
    func verifyCode() {
        // 6자리 숫자 코드인지 간단 검사
        guard verificationCode.count == 6 else {
            errorMessage = "6자리 코드를 입력해주세요"
            return
        }
        // 실제 API 검증 자리에…
        // MyAPI.verifySMS(code: verificationCode, phone: phoneNumber) { valid in … }

        // 여기서는 성공했다고 가정
        errorMessage = nil
    }
}
