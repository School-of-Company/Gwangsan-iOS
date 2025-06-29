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
            ZStack {
                Color.clear
                VStack(alignment: .leading){
                    HStack{
                        HStack(spacing:0){
                            Text("시민")
                                .gwangsanColor(GwangsanAsset.Color.mainBlue500)
                            Text("화폐,")
                                .gwangsanColor(GwangsanAsset.Color.mainYellow500)
                            Text("광산")
                                .gwangsanColor(GwangsanAsset.Color.mainGreen500)
                        }
                        
                        Spacer()
                        
                        Image("Bell")
                            .frame(width: 24, height: 24)
                    }
                    .padding(.horizontal, 24)
                    
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .gwangsanColor(GwangsanAsset.Color.gray400)
                    
                    Image("TestImage1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: 213)
                        .clipped()
                        .padding(.vertical, 24)
                    
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .gwangsanColor(GwangsanAsset.Color.gray400)
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        Text("광산구도시재생센터") // 본점
                            .font(.system(size: 24))
                            .bold()
                        Text("수완세영") // 지점
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal,24)
                    .padding(.bottom, 60)
                    
                    HStack {
                        NavigationLink(destination: ServiceListView()) {
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 160, height: 160)
                                    .cornerRadius(12)
                                VStack(spacing: 20) {
                                    Image("Object")
                                    Text("물건")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                            }
                            .shadow(color: .black.opacity(0.25), radius: 10, x: 2, y: 2)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: ItemListView()) {
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 160, height: 160)
                                    .cornerRadius(12)
                                VStack(spacing: 20) {
                                    Image("Service")
                                    Text("서비스")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                            }
                            .shadow(color: .black.opacity(0.25), radius: 10, x: 2, y: 2)
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MainView()
}

