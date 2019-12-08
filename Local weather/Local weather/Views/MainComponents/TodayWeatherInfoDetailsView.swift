//
//  TodayWeatherInfoDetailsView.swift
//  Local weather
//
//  Created by Michał Pankowski on 25/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct TodayWeatherInfoDetailsView: View {
    
    var viewModel: WeatherViewModel
    
    var body: some View {
        ContentBackgroundVStack(alignment: .leading) {
            TitleView(title: "Details", padding: EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            WeatherInfoView(
                leftTitle: "sunrise", leftData: viewModel.weather?.sys?.getUserReadableDate(format: "HH:mm", timestamp: viewModel.weather?.sys?.sunrise) ?? "",
                rightTitle: "sunset",
                rightData: viewModel.weather?.sys?.getUserReadableDate(format: "HH:mm", timestamp: viewModel.weather?.sys?.sunset) ?? "")
                .padding(.leading, 15).padding(.trailing, 15)
            Divider()
                .background(Color.white)
            
            WeatherInfoView(
                leftTitle: "min. temperature", leftData: String(format: "%d°", Int(viewModel.weather?.main?.minTemperature ?? 0.0)),
                rightTitle: "max. temperature", rightData: String(format: "%d°", Int(viewModel.weather?.main?.maxTemperature ?? 0.0)))
                .padding(.leading, 15).padding(.trailing, 15)
            Divider()
                .background(Color.white)
            
            WeatherInfoView(
                leftTitle: "rain 1hr/3hr", leftData: String(format: "%dmm/%dmm", viewModel.weather?.rain?.oneHour ?? 0, viewModel.weather?.rain?.oneHour ?? 0),
                rightTitle: "snow 1hr/3hr", rightData: String(format: "%dmm/%dmm", viewModel.weather?.snow?.oneHour ?? 0, viewModel.weather?.snow?.oneHour ?? 0))
                .padding(.leading, 15).padding(.trailing, 15)
            Divider()
                .background(Color.white)
            
            WeatherInfoView(
                leftTitle: "wind", leftData: String(format: "%@ %d km/h", viewModel.weather?.wind?.direction ?? "", Int(viewModel.weather?.wind?.speed ?? 0.0)),
                rightTitle: "pressure", rightData: String(format: "%d hPA", Int(viewModel.weather?.main?.pressure ?? 0.0)))
                .padding(.leading, 15).padding(.trailing, 15)
            Divider()
                .background(Color.white)
            
            WeatherInfoView(
                leftTitle: "humidity", leftData: String(format: "%d%%", Int(viewModel.weather?.main?.humidity ?? 0.0)),
                rightTitle: "visibility", rightData: String(format: "%@ km", viewModel.weather?.kmVisibility ?? ""))
                .padding(.leading, 15).padding(.bottom, 15).padding(.trailing, 15)
        }
        
    }
}

