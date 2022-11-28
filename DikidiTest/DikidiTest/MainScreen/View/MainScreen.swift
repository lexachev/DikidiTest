//
//  MainScreen.swift
//  DikidiTest
//
//  Created by Алексей Каллистов on 28.11.2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct MainScreen: View {
    @StateObject var viewModel: MainScreenViewModel = MainScreenViewModel()
    @StateObject var locationManager = LocationManager()
    let timer = Timer.publish(every: 20, on: .main, in: .common).autoconnect()
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    var publicityIdCompany: Int = 0
    var body: some View {
        ZStack{
            if viewModel.responseMainScreen?.data != nil {
                ScrollView{
                    VStack(spacing: 0){
                        Title(url: viewModel.responseMainScreen!.data.image, title: viewModel.responseMainScreen?.data.title ?? "Онлайн запись")
                        
                        Publicity(url: viewModel.responseMainScreen!.data.blocks.catalog[publicityIdCompany].image.origin, name: viewModel.responseMainScreen?.data.blocks.catalog[publicityIdCompany].name ?? "Нет названия")
                        
                        // У меня не было картинок и списка всех категорий, поэтому вместо списка категорий вывел блок новые с указанием их категорий
                        NewSubView(countNews: viewModel.responseMainScreen?.data.blocks.new.count ?? 0, middleCountNew: viewModel.middleCountNew, news: (viewModel.responseMainScreen?.data.blocks.new)!)
                        
                        Example(url: viewModel.responseMainScreen!.data.blocks.examples)
                        
                        Catalog(catalog: viewModel.responseMainScreen!.data.blocks.catalog)
                        
                        Spacer()
                    }
                }
                .background(Color(.gray).opacity(0.1))
                .ignoresSafeArea(edges: [.top])
            }
            else {
                BlurView(style: .regular).ignoresSafeArea()
                CustomProgressView()
            }
        }
        .onAppear{
            viewModel.fetch(coordinateUser: CLLocation(latitude: Double(userLatitude) ?? 0, longitude: Double(userLongitude) ?? 0))
        }
        .onReceive(timer) { _ in
            viewModel.updateDistance(coordinateUser: CLLocation(latitude: Double(userLatitude) ?? 0, longitude: Double(userLongitude) ?? 0))
        }
    }
}



