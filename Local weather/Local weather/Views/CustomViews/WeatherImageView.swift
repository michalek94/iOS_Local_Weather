//
//  WeatherImageView.swift
//  Local weather
//
//  Created by Michał Pankowski on 22/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherImageView: View {
    
    var imageName: String = ""
    
    var body: some View {
        let url = String(format: ConnectionManager.URLs.imageBaseURL, imageName)
        return WebImage(url: URL(string: url))
            .resizable()
            .placeholder(Image("sunny_day"))
            .indicator(.activity)
            .scaledToFit()
            .frame(width: 65, height: 65, alignment: .center)
    }
    
}
