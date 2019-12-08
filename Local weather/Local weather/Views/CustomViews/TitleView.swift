//
//  TitleView.swift
//  Local weather
//
//  Created by Michał Pankowski on 27/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    
    let title: String
    let padding: EdgeInsets
    
    var body: some View {
        Text(title)
            .foregroundColor(Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
            .font(.system(size: 15.0))
            .fontWeight(.semibold)
            .padding(padding)
    }
    
}
