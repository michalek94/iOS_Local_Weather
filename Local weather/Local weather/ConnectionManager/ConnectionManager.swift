//
//  ConnectionManager.swift
//  Local weather
//
//  Created by Michał Pankowski on 19/11/2019.
//  Copyright © 2019 Michał Pankowski. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    private let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func request<T: Codable>(with url: URL, method: HTTPMethod = .get, parameters: [String: Any] = [:], headers: [String : String] = [:], returnType: T.Type, completionHandler: @escaping (Result<T, APIError>) -> Void) {
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        if method != .get {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        headers.forEach({ urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) })
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                completionHandler(.failure(APIError.invalidData))
                return
            }
            
            // https://openweathermap.org/faq
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    guard let responseValue = try? JSONDecoder().decode(T.self, from: data) else {
                        completionHandler(.failure(APIError.jsonDecodingFailure))
                        return
                    }
                    completionHandler(.success(responseValue))
                case 401:
                    completionHandler(.failure(APIError.apiKey))
                    return
                case 404:
                    completionHandler(.failure(APIError.wrongAPIRequest))
                    return
                case 429:
                    completionHandler(.failure(APIError.tooManyCalls))
                    return
                default:
                    if let errorLocalizedDescription = error?.localizedDescription, !errorLocalizedDescription.isEmpty {
                        completionHandler(.failure(APIError.customError(errorLocalizedDescription)))
                        return
                    }
                    completionHandler(.failure(APIError.unknown))
                    return
                }
            }
        }
        
        task.resume()
    }
    
}
