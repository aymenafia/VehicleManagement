//
//  Networker.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation
import Combine

// MARK: - Networker: Handles API Requests

final class Networker: NetworkerProtocol {
    
    
    func get<T: Decodable>(
        type: T.Type,
        url: URL,
        headers: Headers = [:]
    ) -> AnyPublisher<T, Error> {
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<T, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - APIError: Defines Possible API Errors

enum APIError: Error {
    case unknown
    case decodingError 
}
