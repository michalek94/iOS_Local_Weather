//
//  Result.swift
//  Local weather
//
//  Created by Michał Pankowski on 20/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
