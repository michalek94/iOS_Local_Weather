//
//  Double+Direction.swift
//  Local weather
//
//  Created by Michał Pankowski on 25/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

extension Double {
    
    var direction: Direction {
        get {
            return Direction(direction: self)
        }
        set {}
    }
    
}
