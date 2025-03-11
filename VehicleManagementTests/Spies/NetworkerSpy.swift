//
//  NetworkerSpy.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//

import XCTest
import Combine
@testable import VehicleManagement

final class NetworkerSpy: NetworkerProtocol {

    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T: Decodable {
        guard let mockData = try? Data(contentsOf: Bundle.main.url(forResource: "VehicleData", withExtension: "json")!) else {
            return Fail(error: APIError.decodingError).eraseToAnyPublisher()
        }

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        return Just(mockData)
            .decode(type: T.self, decoder: jsonDecoder)
            .mapError { _ in APIError.decodingError }
            .eraseToAnyPublisher()
    }
}
