//
//  MainScreenData.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation

struct MainScreenData: Codable, Hashable{
    let title: String
    let image: String
    let catalog_count: String
    var blocks: Block
}
