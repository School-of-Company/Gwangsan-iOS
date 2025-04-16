//
//  StartView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/16/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            NavigationLink (destination: AliasInputView()) {
                Text("로그인")
            }
        }
    }
}

#Preview {
    StartView()
}
