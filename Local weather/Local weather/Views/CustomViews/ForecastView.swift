//
//  ForecastView.swift
//  Local weather
//
//  Created by Michał Pankowski on 19/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct ForecastView: View {
    
    let forecast: WeatherModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Text(forecast.getUserReadableDate(format: "d MMM"))
                    .font(.subheadline)
                    .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
                Text(forecast.getUserReadableDate(format: "HH:mm"))
                    .font(.footnote)
                    .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.75))
                Text(forecast.weather?.first?.description ?? "")
                    .font(.footnote)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.75))
            }
            
            Spacer()

            WeatherImageView(imageName: forecast.weather?.first?.icon ?? "")
            
            Text(String(format: "%d°", Int(forecast.main?.temperature ?? 0.0)))
                .font(.footnote)
                .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
        }
        .frame(minWidth: 0, maxWidth: 75, idealHeight: 175)
    }
}
