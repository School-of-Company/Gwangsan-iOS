//
//  SignUpFlowViewModel.swift
//  Gwangsan
//
//  Created by 박정우 on 6/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation
import Combine

enum SignUpStep: CaseIterable {
  case phone, password, nickname, major, location, reference, complete
}

final class SignUpDraft {
  var phoneNumber: String = ""
  var password: String = ""
  var nickname: String = ""
  var major: String = ""
  var location: String = ""
  var referenceCode: String = ""
}
