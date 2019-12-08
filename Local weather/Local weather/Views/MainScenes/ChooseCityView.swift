//
//  ChooseCityView.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct ChooseCityView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    @ObservedObject var weatherForecastViewModel: WeatherForecastViewModel
    
    @State private var cityName: String = ""
    @State private var shouldTransit: Bool = false
    
    let dispatchGroup = DispatchGroup()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15.0) {
                Text("The city")
                    .font(.title)
                    .fontWeight(.semibold)
                
                LabelTextField(text: $cityName, labelText: "The city name", placeholderText: "Fill in the city name")
  
                VStack {
                    RoundedButton(buttonAction: {
                        self.weatherViewModel.fetchWeather(city: self.cityName, dispatch: self.dispatchGroup)
                        self.weatherForecastViewModel.fetchForecast(city: self.cityName, dispatch: self.dispatchGroup)
                        self.dispatchGroup.notify(queue: .main) {
                            if self.weatherViewModel.weather != nil && self.weatherForecastViewModel.forecast != nil {
                                self.shouldTransit = true
                            } else {
                                self.shouldTransit = false
                            }
                        }
                    }, buttonTitle: "Choose")
                    NavigationLink(destination: ActualWeatherView(weatherViewModel: weatherViewModel, weatherForecastViewModel: weatherForecastViewModel), isActive: $shouldTransit) {
                        EmptyView()
                    }
                }
            }
            .listRowInsets(EdgeInsets())
            .navigationBarTitle("Choose city")
        }
    }
    
}
