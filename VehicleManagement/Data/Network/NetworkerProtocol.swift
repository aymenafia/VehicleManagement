//
//  NetworkerProtocol.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation
import Combine

// MARK: - Networker Protocol

protocol NetworkerProtocol: AnyObject {
        
    typealias Headers = [String: Any]
    
    
    /// Performs an HTTP GET request and returns a decoded object.
    ///
    /// - Parameters:
    ///   - type: The expected `Decodable` model type.
    ///   - url: The API endpoint URL.
    ///   - headers: Optional headers to include in the request.
    /// - Returns: A publisher that emits the decoded object or an error.
    func get<T: Decodable>(
        type: T.Type,
        url: URL,
        headers: Headers
    ) -> AnyPublisher<T, Error>
}
