//
//  FurtherWeatherForecastView.swift
//  Local weather
//
//  Created by Michał Pankowski on 26/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct FurtherWeatherForecastView: View {
    
    var viewModel: WeatherForecastViewModel
    
    var body: some View {
        ContentBackgroundVStack(alignment: .leading) {
            TitleView(title: "Further forecast", padding: EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.forecast?.getForecast(isFromToday: false) ?? [], id: \.internalId) { cast in
                        ForecastView(forecast: cast)
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        }
    }
    
}
