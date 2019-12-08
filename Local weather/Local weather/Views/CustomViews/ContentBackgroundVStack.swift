//
//  ContentBackgroundVStack.swift
//  Local weather
//
//  Created by Michał Pankowski on 27/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import SwiftUI

struct ContentBackgroundVStack<Content:View>: View {
    
    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let content: Content
    
    init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: self.alignment, spacing: self.spacing) {
            self.content
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color(red: 73/255, green: 80/255, blue: 108/255))
        .cornerRadius(15.0)
        .shadow(radius: 15)
        .padding(15)
    }
    
}
