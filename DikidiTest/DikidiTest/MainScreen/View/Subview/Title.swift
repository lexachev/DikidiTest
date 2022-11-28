//
//  Title.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI

struct Title: View {
    let url: String
    let title: String
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: url)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        CustomProgressView()
                    }
                    
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .offset(y: 35)
                }
                Spacer()
            }
            HStack{
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "location.circle")
                        .padding(.top, UIScreen.main.bounds.height * 0.08 )
                        .padding(.trailing, UIScreen.main.bounds.width * 0.05 )
                }
            }
            
        }
    }
}
