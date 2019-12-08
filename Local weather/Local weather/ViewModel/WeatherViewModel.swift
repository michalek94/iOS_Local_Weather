//
//  WeatherViewModel.swift
//  Local weather
//
//  Created by Michał Pankowski on 21/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var weather: WeatherModel?
    
    func fetchWeather(city: String, dispatch: DispatchGroup) {
        var query = ConnectionManager.Query.baseQuery
        query["q"] = city
        
        if let url = URL(string: ConnectionManager.URLs.weather)?.queries(query) {
            dispatch.enter()
            ConnectionManager().request(with: url, returnType: WeatherModel.self) { (result) in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        dispatch.leave()
                        self.weather = data
                    }
                case .failure(let error):
                    dispatch.leave()
                    print("An error has occurred: \(error.description)")
                }
            }
        }
    }
    
}
