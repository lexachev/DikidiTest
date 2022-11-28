//
//  MainScreenViewModel.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import CoreLocation

class MainScreenViewModel: ObservableObject {
    @Published var responseMainScreen: ResponseMainScreen? = nil
    @Published var middleCountNew: Int = 0
    let cityId = 468902
    
    func updateDistance(coordinateUser: CLLocation){
        for i in 0...responseMainScreen!.data.blocks.catalog.count - 1 {
            let coordinateCompany = CLLocation(latitude: Double(responseMainScreen!.data.blocks.catalog[i].lat) ?? 0, longitude: Double(responseMainScreen!.data.blocks.catalog[i].lng) ?? 0)
            let distance =  Double(coordinateUser.distance(from: coordinateCompany))
            if distance > 999 {
                responseMainScreen!.data.blocks.catalog[i].distace = "\(Int(Double(distance * 0.0001))) км"
            } else {
                responseMainScreen!.data.blocks.catalog[i].distace = "\(distance) метров"
            }
        }
    }
    
    func fetch(coordinateUser: CLLocation) {
        let texturl = "https://api-beauty.test.dikidi.ru/home/info?GET_ЗНАЧЕНИЯ"
        let str = texturl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = URL(string: str ?? "") else { return }
        var body: [String: Any] = [:]
        body = [
            "city_id": cityId
        ]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM", forHTTPHeaderField:"Authorization")
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else {
                print("Invalid auth data")
                return
            }
            DispatchQueue.main.async {
                do{
                    let responseMainScreen = try JSONDecoder().decode(ResponseMainScreen.self, from: data)
                    if responseMainScreen.error.code == 0 {
                        self?.responseMainScreen = responseMainScreen
                        self?.middleCountNew = Int(Double(self?.responseMainScreen?.data.blocks.new.count ?? 0) * 0.5) - 1
                        self?.updateDistance(coordinateUser: coordinateUser)
                    } else {
                        print(responseMainScreen.error.code)
                        print(responseMainScreen.error.message ?? "")
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }.resume()
    }
}
