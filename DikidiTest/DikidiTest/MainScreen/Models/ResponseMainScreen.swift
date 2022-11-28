//
//  ResponseMainScreen.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation

struct ResponseMainScreen: Codable, Hashable{
    let error: ErrorResponse
    var data: MainScreenData
}
