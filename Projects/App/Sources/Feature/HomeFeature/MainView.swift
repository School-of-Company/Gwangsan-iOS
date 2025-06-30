//
//  MainView.swift
//  Gwangsan
//
//  Created by 박정우 on 4/29/25.
//  Copyright © 2025 schoolcompany. All rights reserved.
//

import SwiftUI

struct MainView: View {
    let mainImages = ["Main1", "Main2", "Main3", "Main4", "Main5", "Main6"]
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear
                VStack(alignment: .leading) {
                    HStack {
                        HStack(spacing: 0) {
                            Text("시민")
                                .gwangsanColor(GwangsanAsset.Color.mainBlue500)
                            Text("화폐,")
                                .gwangsanColor(GwangsanAsset.Color.mainYellow500)
                            Text("광산")
                                .gwangsanColor(GwangsanAsset.Color.mainGreen500)
                        }
                        .font(.custom("Cafe24SsurroundOTF", size: 16))
                        .padding(.vertical, 10)

                        Spacer()
                        
                        NavigationLink(destination: MyInForm()){
                            Image("Bell")
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal, 24)

                    Rectangle()
                        .frame(height: 1)
                        .gwangsanColor(GwangsanAsset.Color.gray400)
                    
                    TabView(selection: $currentIndex) {
                        ForEach(0..<mainImages.count, id: \.self) { index in
                            Image(mainImages[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .clipped()
                                .tag(index)
                                .transition(.slide)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 250)
                    .onReceive(timer) { _ in
                        withAnimation {
                            currentIndex = (currentIndex + 1) % mainImages.count
                        }
                    }

                    Rectangle()
                        .frame(height: 1)
                        .gwangsanColor(GwangsanAsset.Color.gray400)
                        .padding(.bottom, 30)

                    VStack(alignment: .leading) {
                        Text("광산구도시재생센터")
                            .font(.system(size: 24))
                            .bold()
                        Text("수완세영")
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 60)

                    HStack {
                        NavigationLink(destination: ServiceListView()) {
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 160, height: 160)
                                    .cornerRadius(12)
                                VStack(spacing: 30) {
                                    Image("Object")
                                    Text("물건")
                                        .font(.custom("Cafe24SsurroundOTF", size: 24))
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
                                        .font(.custom("Cafe24SsurroundOTF", size: 24))
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
