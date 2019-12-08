//
//  Weather.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class Weather: Codable {
    let id: Int64?
    let main, description, icon: String?
}
