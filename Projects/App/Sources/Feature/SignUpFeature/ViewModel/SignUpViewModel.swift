//
//  SignUpViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var phoneNumber: String = ""

    var isPasswordMatch: Bool {
        !password.isEmpty && password == confirmPassword
    }
}
