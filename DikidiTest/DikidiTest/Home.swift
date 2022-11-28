//
//  Home.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            TabView{
                ZStack{
                    VStack(spacing: 0){
                        Spacer()
                        Divider()
                   }
                    MainScreen()
                }
                .tabItem({
                    Image(systemName: "house")
                    Text("Главная")
                })
                
                Text("Акции")
                    .tabItem({
                        Image(systemName: "percent")
                        Text("Акции")
                    })
                Text("Мои записи")
                    .tabItem({
                        Image(systemName: "book")
                        Text("Мои записи")
                    })
                Text("Чаты")
                    .tabItem({
                        Image(systemName: "text.bubble")
                        Text("Чаты")
                    })
                Text("Ещё")
                    .tabItem({
                        Image(systemName: "contextualmenu.and.cursorarrow")
                        Text("Ещё")
                    })
            }
        }
    }
}
