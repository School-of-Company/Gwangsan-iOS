//
//  AuthModel.swift
//  Gwangsan
//
//  Created by 박정우 on 7/7/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import Foundation

struct SignupRequest: Encodable {
    let name: String
    let nickname: String
    let password: String
    let phoneNumber: String
    let dongName: String
    let placeName: String
    let recommender: String
    let specialties: [String]
}
