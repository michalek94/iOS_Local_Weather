//
//  WeatherForecastModel.swift
//  Local weather
//
//  Created by Michał Pankowski on 26/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

final class WeatherForecastModel: Codable, Identifiable  {
    
    let city:           City?
    let coordinate:     Coordinate?
    let country:        String?
    let timezone:       Double?
    let code:           String?
    let message:        Double?
    let cnt:            Int64?
    let list:           [WeatherModel]?
    let internalId =    UUID()
    
    enum CodingKeys: String, CodingKey {
        case city
        case coordinate     = "coord"
        case country
        case timezone
        case code           = "cod"
        case message
        case cnt
        case list
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.city =             try values.decodeIfPresent(City.self, forKey: .city)
        self.coordinate =       try values.decodeIfPresent(Coordinate.self, forKey: .coordinate)
        self.country =          try values.decodeIfPresent(String.self, forKey: .country)
        self.timezone =         try values.decodeIfPresent(Double.self, forKey: .timezone)
        self.code =             try values.decodeIfPresent(String.self, forKey: .code)
        self.message =          try values.decodeIfPresent(Double.self, forKey: .message)
        self.cnt =              try values.decodeIfPresent(Int64.self, forKey: .cnt)
        self.list =             try values.decodeIfPresent([WeatherModel].self, forKey: .list)
    }
    
}

extension WeatherForecastModel {
    
    func getForecast(isFromToday: Bool) -> [WeatherModel]? {
        var forecasts: [WeatherModel]? = []
        
        if !(self.list?.isEmpty ?? false) {
            forecasts = self.list!
                .filter({ model -> Bool in
                    guard model.timestamp != nil else { return false }
                    
                    let date = Date(timeIntervalSince1970: model.timestamp!)
                    let isDateInToday = isFromToday ? Calendar.current.isDateInToday(date) : !Calendar.current.isDateInToday(date)
                    
                    return isDateInToday
                })
                .sorted { $0.timestamp ?? 0.0 < $1.timestamp ?? 0.0 }
        }
        
        if !(forecasts?.isEmpty ?? false) {
            return forecasts
        }
        
        return nil
    }
    
}
