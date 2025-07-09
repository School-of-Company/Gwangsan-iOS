//
//  Device.swift
//  Gwangsan
//
//  Created by 박정우 on 7/9/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import UIKit

struct DeviceIdentifier {
  private static let key = "deviceId"

  static var id: String {
    let defaults = UserDefaults.standard
    if let existing = defaults.string(forKey: key) {
      return existing
    }
    let newId = UIDevice.current.identifierForVendor?.uuidString
                ?? UUID().uuidString
    defaults.set(newId, forKey: key)
    return newId
  }
}
