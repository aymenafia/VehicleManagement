//
//  LoadVehicleDataTests.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//

import XCTest
import Combine
@testable import VehicleManagement

final class LoadVehicleDataTests: XCTestCase {
    var service: VehicleDataServiceSpy!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        service = VehicleDataServiceSpy()
    }

    func testLoadVehicleDataSuccess() {
        let exp = expectation(description: "Load Vehicle Data")

        service.loadVehicleData()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Error: \(error)")
                }
            }, receiveValue: { vehicleData in
                XCTAssertEqual(vehicleData.brands.count, 4)
                XCTAssertEqual(vehicleData.brands.first?.name, "Audi")
                exp.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [exp], timeout: 2.0)
    }
}
