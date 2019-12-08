//
//  Main.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class Main: Codable {
    let temperature, pressure, humidity, minTemperature, maxTemperature, seaLevel, groundLevel: Double?
    
    enum CodingKeys: String, CodingKey {
        case temperature        = "temp"
        case pressure
        case humidity
        case minTemperature     = "temp_min"
        case maxTemperature     = "temp_max"
        case seaLevel           = "sea_level"
        case groundLevel        = "grnd_level"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temperature =      try values.decodeIfPresent(Double.self, forKey: .temperature)
        self.pressure =         try values.decodeIfPresent(Double.self, forKey: .pressure)
        self.humidity =         try values.decodeIfPresent(Double.self, forKey: .humidity)
        self.minTemperature =   try values.decodeIfPresent(Double.self, forKey: .minTemperature)
        self.maxTemperature =   try values.decodeIfPresent(Double.self, forKey: .maxTemperature)
        self.seaLevel =         try values.decodeIfPresent(Double.self, forKey: .seaLevel)
        self.groundLevel =      try values.decodeIfPresent(Double.self, forKey: .groundLevel)
    }
}
