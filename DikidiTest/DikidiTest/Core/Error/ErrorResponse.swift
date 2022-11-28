//
//  ErrorAPIStatus.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation

struct ErrorResponse: Codable, Hashable{
    let code: Int
    let message: String?
}
