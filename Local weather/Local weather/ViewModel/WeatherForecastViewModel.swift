//
//  WeatherForecastViewModel.swift
//  Local weather
//
//  Created by Michał Pankowski on 02/12/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

class WeatherForecastViewModel: ObservableObject {
    
    @Published var forecast: WeatherForecastModel?
    
    func fetchForecast(city: String, dispatch: DispatchGroup) {
        var query = ConnectionManager.Query.baseQuery
        query["q"] = city
        
        if let url = URL(string: ConnectionManager.URLs.forecast)?.queries(query) {
            dispatch.enter()
            ConnectionManager().request(with: url, returnType: WeatherForecastModel.self) { (result) in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        dispatch.leave()
                        self.forecast = data
                    }
                case .failure(let error):
                    dispatch.leave()
                    print("An error has occurred: \(error.description)")
                }
            }
        }
    }
}
