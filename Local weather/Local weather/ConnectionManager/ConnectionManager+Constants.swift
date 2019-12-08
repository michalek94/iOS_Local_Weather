//
//  ConnectionManager+Constants.swift
//  Local weather
//
//  Created by Michał Pankowski on 19/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

extension ConnectionManager {
    
    static let APP_ID = "bada95798cdbe79f0ac2fdd6a56037d6"
    
    enum URLs {
        static var baseURL          = "https://api.openweathermap.org/data/2.5"
        static var weather          = baseURL + "/weather"
        static var forecast         = baseURL + "/forecast"
        static var imageBaseURL     = "https://openweathermap.org/img/wn/%@.png"
    }
    
    enum Query {
        static var baseQuery = ["q": "", "appid": ConnectionManager.APP_ID, "units": "metric", "lang": "en"]
    }

}
