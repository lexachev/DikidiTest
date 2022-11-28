//
//  Company.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation

struct Company: Codable, Hashable{
    let id: String
    let name: String
    let image: ImageModel
    let street: String
    let house: String
    let schedule: [Schedule]
    let lat: String
    let lng: String
    let categories: [String]
    let rating: Int
    let isMaster: Bool
    let currency: Currency
    var distace: String?
}
