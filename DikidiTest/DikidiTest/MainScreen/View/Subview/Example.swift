//
//  Example.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct Example: View {
    let url: String
    
    var body: some View {
        HStack{
            Text("Коллекция работ")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        
        AsyncImage(url: URL(string: url)!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Rectangle())
                .cornerRadius(15)
                .padding(.horizontal)
        } placeholder: {
            CustomProgressView()
        }
        
        HStack{
            Text("Посмотрите фото работ и выбирите куда записаться")
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
            
            Button{
                
            } label: {
                Text("Посмотреть")
                    .padding(.all, 5)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(3)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        
        Divider()
    }
}
