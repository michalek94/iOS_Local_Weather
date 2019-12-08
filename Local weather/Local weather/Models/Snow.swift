//
//  Snow.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class Snow: Codable {
    let oneHour, threeHour: Double?
    
    enum CodingKeys: String, CodingKey {
        case oneHour        = "1h"
        case threeHour      = "3h"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.oneHour =    try values.decodeIfPresent(Double.self, forKey: .oneHour)
        self.threeHour =  try values.decodeIfPresent(Double.self, forKey: .threeHour)
    }
}
