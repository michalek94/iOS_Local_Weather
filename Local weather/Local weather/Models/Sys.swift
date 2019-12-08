//
//  Sys.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class Sys: Codable {
    let id, type: Int64?
    let message, sunrise, sunset: Double?
    let country: String?
}

extension Sys {
    
    func getUserReadableDate(format dateFormat: String, timestamp: Double?) -> String {
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
