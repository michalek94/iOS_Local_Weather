//
//  WeatherModel.swift
//  Local weather
//
//  Created by Michał Pankowski on 19/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

final class WeatherModel: Codable, Identifiable {
    
    let coordinate:     Coordinate?
    let weather:        [Weather]?
    let base:           String?
    let main:           Main?
    let visibility:     Int64?
    let wind:           Wind?
    let cloud:          Cloud?
    let rain:           Rain?
    let snow:           Snow?
    let timestamp:      Double?
    let sys:            Sys?
    let timezone:       Double?
    let id:             Int64?
    let name:           String?
    let code:           Int64?
    let internalId =    UUID()
    
    enum CodingKeys: String, CodingKey {
        case coordinate     = "coord"
        case weather
        case base
        case main
        case visibility
        case wind
        case cloud          = "clouds"
        case rain
        case snow
        case timestamp      = "dt"
        case sys
        case timezone
        case id
        case name
        case code           = "cod"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.coordinate =   try values.decodeIfPresent(Coordinate.self, forKey: .coordinate)
        self.weather =      try values.decodeIfPresent([Weather].self, forKey: .weather)
        self.base =         try values.decodeIfPresent(String.self, forKey: .base)
        self.main =         try values.decodeIfPresent(Main.self, forKey: .main)
        self.visibility =   try values.decodeIfPresent(Int64.self, forKey: .visibility)
        self.wind =         try values.decodeIfPresent(Wind.self, forKey: .wind)
        self.cloud =        try values.decodeIfPresent(Cloud.self, forKey: .cloud)
        self.rain =         try values.decodeIfPresent(Rain.self, forKey: .rain)
        self.snow =         try values.decodeIfPresent(Snow.self, forKey: .snow)
        self.timestamp =    try values.decodeIfPresent(Double.self, forKey: .timestamp)
        self.sys =          try values.decodeIfPresent(Sys.self, forKey: .sys)
        self.timezone =     try values.decodeIfPresent(Double.self, forKey: .timezone)
        self.id =           try values.decodeIfPresent(Int64.self, forKey: .id)
        self.name =         try values.decodeIfPresent(String.self, forKey: .name)
        self.code =         try values.decodeIfPresent(Int64.self, forKey: .code)
    }
    
}

extension WeatherModel {
    
    var kmVisibility: String {
        let dVisibility = Double(visibility ?? 0)
        return String(format: "%d", (Int(dVisibility/1000.0)))
    }
    
    func getUserReadableDate(format dateFormat: String) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.locale = .current
        timeFormatter.dateFormat = dateFormat
        
        if let time = timestamp {
            let date = Date(timeIntervalSince1970: time)
            return timeFormatter.string(from: date)
        }
        
        return timeFormatter.string(from: Date())
    }
    
}
