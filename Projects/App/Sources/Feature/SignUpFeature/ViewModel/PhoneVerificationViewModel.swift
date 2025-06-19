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
    @Published var isPhoneError: Bool = false
    @Published var isCodeError: Bool = false
    
    func sendCode() {
        guard phoneNumber.count == 11, phoneNumber.hasPrefix("010") else {
            errorMessage = "올바른 번호를 입력해주세요"
            isPhoneError = true
            isCodeSent = false
            return
        }
        isCodeSent = true
        isPhoneError = false
        errorMessage = nil
    }
    
    func verifyCode() {
        verificationCode = verificationCode.filter { $0.isNumber }
        let pattern = "^[0-9]{6}$"
        if verificationCode.range(of: pattern, options: .regularExpression) == nil {
            errorMessage   = "6자리 숫자를 입력해주세요"
            isCodeError    = true
            return
        }
        isCodeError    = false
        errorMessage   = nil
    }
}
