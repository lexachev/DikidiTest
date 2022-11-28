//
//  Catalog.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct Catalog: View {
    var catalog: [Company]
    
    var body: some View {
        HStack{
            Text("Каталог")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        
        ForEach(catalog, id: \.self){ company in
            CardOfCatalog(company: company)
        }
    }
}

struct CardOfCatalog: View {
    let company: Company
    
    var body: some View {
        ZStack{
            HStack{
                AsyncImage(url: URL(string: company.image.thumb)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                } placeholder: {
                    CustomProgressView()
                }
                
                VStack(alignment: .leading){
                    Text(company.name)
                    
                        .fontWeight(.bold)
                    Text("\(company.street) \(company.house)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(company.distace ?? "")
                        .font(.caption)
                        .foregroundColor(.blue)
                    HStack{
                        Text(String(company.rating))
                            .font(.caption)
                        
                        ForEach(0...4, id: \.self) { i in
                            Image(systemName: "star.fill")
                                .foregroundColor(i + 1 <= company.rating ? .yellow : .gray.opacity(0.4))
                        }
                    }
                }
                
                Spacer()
            }
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 3)
            
            
        }
    }
}
