//
//  WeatherInfoView.swift
//  Local weather
//
//  Created by Michał Pankowski on 25/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct WeatherInfoView: View {
    
    var leftTitle: String   = "no data"
    var leftData: String    = "no data"
    var rightTitle: String  = "no data"
    var rightData: String   = "no data"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(leftTitle.uppercased())
                        .font(.system(size: 10.0))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.75))
                    Text(leftData)
                        .font(.system(size: 15.0))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(rightTitle.uppercased())
                        .font(.system(size: 10.0))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 0.75))
                    Text(rightData)
                        .font(.system(size: 15.0))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
    }
    
    init(leftTitle: String, leftData: String, rightTitle: String, rightData: String) {
        self.leftTitle = leftTitle
        self.leftData = leftData
        self.rightTitle = rightTitle
        self.rightData = rightData
    }
}
