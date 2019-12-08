//
//  WeatherHeader.swift
//  Local weather
//
//  Created by Michał Pankowski on 22/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct WeatherHeader: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ContentBackgroundVStack(alignment: .leading, spacing: 0) {
            TitleView(title: "Today", padding: EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            HStack {
                VStack {
                    WeatherImageView(imageName: viewModel.weather?.weather?.first?.icon ?? "")
                    Text(viewModel.weather?.weather?.first?.description ?? "")
                        .font(.system(size: 25.0, weight: .medium, design: .rounded))
                        .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.75))
                        .padding(.bottom, 15)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                Divider()
                    .background(Color.white)
                
                Spacer()
                
                VStack {
                    DateView(model: viewModel)
                    Text(String(format: "%d°", Int(viewModel.weather?.main?.temperature ?? 0.0)))
                        .font(.system(size: 50.0))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.95))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        }
    }
    
}
