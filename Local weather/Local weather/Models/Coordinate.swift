//
//  Coordinate.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class Coordinate: Codable {
    let longitude, latitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case longitude      = "lon"
        case latitude       = "lat"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.longitude =    try values.decodeIfPresent(Double.self, forKey: .longitude)
        self.latitude =     try values.decodeIfPresent(Double.self, forKey: .latitude)
    }
}
