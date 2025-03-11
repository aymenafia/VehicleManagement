
import Foundation
import Combine
import os.log

// MARK: - Network Vehicle DataService 

final class NetworkVehicleDataService: VehicleDataServiceProtocol {
    private let networker: NetworkerProtocol
    private let logger: LoggerProtocol
    private let url: URL
    
    init(url: URL,
         networker: NetworkerProtocol = Networker(),
         logger: LoggerProtocol = AppLogger()) {
        self.url = url
        self.networker = networker
        self.logger = logger
    }
    
    func loadVehicleData() -> AnyPublisher<VehicleData, Error> {
        return networker.get(type: VehicleData.self, url: url, headers: [:])
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.logger.log("Successfully loaded vehicle data from server", type: .info)
            }, receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.logger.log("Failed to load vehicle data: \(error)", type: .error)
                }
            })
            .eraseToAnyPublisher()
    }

}
