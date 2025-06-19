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
    
    // 새로 추가
    @Published var isPhoneError: Bool = false
    @Published var isCodeError: Bool = false

    /// SMS 인증번호 전송 요청
    func sendCode() {
        // *올바른 국내 휴대폰 번호(예: 01012345678) 길이 검사*
        guard phoneNumber.count == 11, phoneNumber.hasPrefix("010") else {
            errorMessage = "올바른 번호를 입력해주세요"
            isPhoneError = true
            isCodeSent = false
            return
        }
        // 성공했을 때
        isCodeSent = true
        isPhoneError = false
    }

    /// 인증번호 검증 요청
    func verifyCode() {
        guard verificationCode.count == 6 else {
            errorMessage = "6자리 코드를 입력해주세요"
            isCodeError = true
            return
        }
        // 성공했을 때
        errorMessage = nil
        isCodeError = false 
    }
}
