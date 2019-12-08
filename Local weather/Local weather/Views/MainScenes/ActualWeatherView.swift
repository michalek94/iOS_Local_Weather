//
//  ActualWeatherView.swift
//  Local weather
//
//  Created by Michał Pankowski on 19/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct ActualWeatherView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    @ObservedObject var weatherForecastViewModel: WeatherForecastViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                WeatherHeader(viewModel: weatherViewModel)
                TodayWeatherInfoDetailsView(viewModel: weatherViewModel)
                if !(weatherForecastViewModel.forecast?.getForecast(isFromToday: true)?.isEmpty ?? true) {
                    TodayWeatherForecastView(viewModel: weatherForecastViewModel)
                }
                if !(weatherForecastViewModel.forecast?.getForecast(isFromToday: false)?.isEmpty ?? true) {
                    FurtherWeatherForecastView(viewModel: weatherForecastViewModel)
                }
            }
        }
        .onDisappear {
            self.weatherViewModel.weather = nil
            self.weatherForecastViewModel.forecast = nil
        }
        .navigationBarTitle(weatherViewModel.weather?.name ?? "")
    }
    
}
