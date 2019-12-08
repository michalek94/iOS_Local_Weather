//
//  Wind.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class Wind: Codable {
    let speed, degrees: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees    = "deg"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.speed =    try values.decodeIfPresent(Double.self, forKey: .speed)
        self.degrees =  try values.decodeIfPresent(Double.self, forKey: .degrees)
    }
}

extension Wind {
    var direction: String? {
        get {
            return (degrees?.direction).map { $0.rawValue }?.uppercased()
        }
    }
}
