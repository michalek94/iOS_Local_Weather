//
//  APIError.swift
//  Local weather
//
//  Created by Michał Pankowski on 29/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

enum APIError: LocalizedError {
    case invalidData
    case jsonDecodingFailure
    case wrongAPIRequest
    case tooManyCalls
    case apiKey
    case unknown
    case customError(String)
    
    var description: String {
        switch self {
        case .invalidData:
            return "Invalid data"
        case .jsonDecodingFailure:
            return "JSON Decoding has failed"
        case .wrongAPIRequest:
            return "Wrong API request"
        case .tooManyCalls:
            return "Too many calls at this tariff"
        case .apiKey:
            return "Wrong API key"
        case .unknown:
            return "Uknown error has occurred"
        case .customError(let description):
            return description
        }
    }
}
