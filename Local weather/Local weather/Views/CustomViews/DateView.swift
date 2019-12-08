//
//  DateView.swift
//  Local weather
//
//  Created by Michał Pankowski on 22/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct DateView: View {
    
    var model: WeatherViewModel? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(model?.weather?.getUserReadableDate(format: "d MMM") ?? "")")
                .font(.headline)
                .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
            Text("\(model?.weather?.getUserReadableDate(format: "EEEE") ?? "")")
                .font(.subheadline)
                .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.75))
        }
        
    }
}
