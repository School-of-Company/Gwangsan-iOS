//
//  SignUpViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 4/17/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//
// SignUpViewModel.swift
import SwiftUI

final class SignUpViewModel: ObservableObject {
    enum Step: Hashable {
        case nickname
        case password
        case location
        case major
        case review
        case complete
    }

    @Published var path = NavigationPath()

    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var selectedLocation: String = ""
    @Published var branch: String = ""
    @Published var selectedMajors: [String] = []   
    @Published var reference: String = ""

//    // 유효성
//    var isNicknameValid: Bool { !nickname.isEmpty }
//    var isPasswordValid: Bool { password.count >= 6 }
//    var isBranchValid: Bool { branch != nil }
//    var isMajorValid: Bool { major != nil }

    func submit() {
        print("이름:\(name)")
        print("닉네임:\(nickname)")
        print("비밀번호:\(password)")
        print("비밀번호 확안:\(confirmPassword)") // 유효성 검사로 없애야함
        print("동:\(selectedLocation)")
        print("지점:\(branch)")
        print("전공:\(selectedMajors)")
        print("추천인:\(reference)")
    }
}
