//
//  Publicity.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct Publicity: View {
    let url: String
    let name: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Премиум")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("Реклама")
                    .font(.caption)
                    .padding(.all, 5)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 2){
                AsyncImage(url: URL(string: url)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                } placeholder: {
                    CustomProgressView()
                }
                
                Spacer()
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                Spacer()
                Button{
                    
                } label: {
                    Text("Записаться")
                        .padding(.all, 5)
                        .background(.red.opacity(0.8))
                        .cornerRadius(30)
                        .foregroundColor(.white)
                }
            }
            Divider()
        }
        .padding()
    }
}
