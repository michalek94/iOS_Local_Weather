//
//  Direction+String.swift
//  Local weather
//
//  Created by Michał Pankowski on 25/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

extension Direction: CustomStringConvertible  {
    
    static let all: [Direction] = [.n, .nne, .ne, .ene, .e, .ese, .se, .sse, .s, .ssw, .sw, .wsw, .w, .wnw, .nw, .nnw]
    
    var description: String {
        return rawValue.uppercased()
    }
    
    init(direction: Double) {
        let index = Int((direction + 11.25).truncatingRemainder(dividingBy: 360) / 22.5)
        self = Direction.all[index]
    }
    
}
