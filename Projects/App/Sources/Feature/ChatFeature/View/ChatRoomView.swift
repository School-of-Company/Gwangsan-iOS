//
//  ChatRoomView..swift
//  Gwangsan
//
//  Created by 박정우 on 5/1/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct ChatRoomView: View {
    let userName: String

    var body: some View {
        VStack {
            Text("채팅방: \(userName)")
                .font(.title2)
            Spacer()
        }
        .navigationTitle(userName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
