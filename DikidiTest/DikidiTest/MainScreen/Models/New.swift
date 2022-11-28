//
//  New.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation

struct New: Codable, Hashable{
    let id: String
    let image: ImageModel
    let name: String
    let categories: [String]
}
