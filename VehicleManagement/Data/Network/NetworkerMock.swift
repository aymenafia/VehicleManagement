//
//  NetworkerMock.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation
import Combine

// MARK: - NetworkerMock: Simulated API Response

final class NetworkerMock: NetworkerProtocol {
    
    typealias Headers = [String: Any]
    
    
    func get<T: Decodable>(
        type: T.Type,
        url: URL,
        headers: Headers = [:]
    ) -> AnyPublisher<T, Error> {
        
        // simulate occasional decoding failures.
        let randomValue = Int.random(in: 0...10)
        guard randomValue % 2 == 0 else {
            return Fail(error: APIError.decodingError)
                .eraseToAnyPublisher()
        }
        
        guard let fileURL = Bundle.main.url(forResource: "VehicleData", withExtension: "json") else {
            return Fail(error: APIError.unknown).eraseToAnyPublisher()
        }
        
        return Future<T, Error> { promise in
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decoded = try decoder.decode(T.self, from: data)
                promise(.success(decoded))
            } catch {
                promise(.failure(APIError.decodingError))
            }
        }
        .delay(for: .seconds(1), scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
