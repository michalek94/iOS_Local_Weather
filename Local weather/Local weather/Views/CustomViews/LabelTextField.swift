//
//  LabelTextField.swift
//  Local weather
//
//  Created by Michał Pankowski on 21/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct LabelTextField: View {
    
    var text: Binding<String>
    var labelText: String
    var placeholderText: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(labelText)
                .font(.headline)
            TextField(placeholderText, text: text)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
        } 
        .padding(.horizontal, 15)
    }
    
}
