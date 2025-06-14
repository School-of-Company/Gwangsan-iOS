//
//  LoginViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/14/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var password: String = ""
    
    func submit() {
        print("별칭:\(nickname)")
        print("비밀번호:\(password)")
    }
    //비밀번호 유효성 검사
}
