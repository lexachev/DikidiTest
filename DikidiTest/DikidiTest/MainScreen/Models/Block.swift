//
//  Block.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation

struct Block: Codable, Hashable{
    let examples: String
    let new: [New]
    var catalog: [Company]
}
