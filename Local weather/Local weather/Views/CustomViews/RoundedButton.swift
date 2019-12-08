//
//  RoundedButton.swift
//  Local weather
//
//  Created by Michał Pankowski on 21/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct RoundedButton : View {
    
    var buttonAction: () -> Void
    var buttonTitle: String
    
    var body: some View {
        
        Button(action: buttonAction) {
            HStack {
                Spacer()
                Text(buttonTitle)
                    .font(.headline)
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .background(Color.red)
        .cornerRadius(5.0)
        .padding(.horizontal, 50)
    
    }
}
