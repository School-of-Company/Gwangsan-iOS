//
//  MainView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            HStack(spacing: 16) {
                NavigationLink(destination: ServiceView()) {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 150)
                            .cornerRadius(12)

                        Text("서비스")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
                
                NavigationLink(destination: ItemListView()) {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 150)
                            .cornerRadius(12)

                        Text("물건")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
