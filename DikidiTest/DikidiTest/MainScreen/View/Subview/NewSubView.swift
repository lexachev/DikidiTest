//
//  NewSubView.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct NewSubView: View {
    let countNews: Int
    let middleCountNew: Int
    let news: [New]
    
    var body: some View {
        HStack{
            Text("Новые")
                .font(.title2)
                .fontWeight(.bold)
            
            
            Text(String(countNews))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.horizontal)
        
        ScrollView(.horizontal){
            HStack{
                VStack{
                    HStack{
                        ForEach(0...middleCountNew, id: \.self){ i in
                            VStack{
                                CardOfNew(image: news[i].image.thumb, catigories: news[i].categories.joined(separator: ","))
                                if middleCountNew + i < countNews {
                                    CardOfNew(image: news[i + middleCountNew].image.thumb, catigories: news[i + middleCountNew].categories.joined(separator: ","))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        Divider()
    }
    
}


struct CardOfNew: View {
    let image: String
    let catigories: String
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Rectangle())
                    .frame(width: 200, height: 120)
                    .cornerRadius(15)
            } placeholder: {
                CustomProgressView()
            }
            
            Text(catigories)
                .fontWeight(.bold)
                .frame(width: 190, height: 110)
        }
    }
}
