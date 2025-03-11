//
//  VehicleDataServiceSpy.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//

import XCTest
import Combine
@testable import VehicleManagement

final class VehicleDataServiceSpy: VehicleDataServiceProtocol {
    let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = NetworkerSpy()) {
        self.networker = networker
    }

    func loadVehicleData() -> AnyPublisher<VehicleData, Error> {
        return networker.get(type: VehicleData.self,
                             url: URL(string: "https://mock-api.com/vehicles")!,
                             headers: [:])
    }
}
