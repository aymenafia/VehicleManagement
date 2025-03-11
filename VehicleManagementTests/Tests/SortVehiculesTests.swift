//
//  SortVehiculesTests.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//

import XCTest
@testable import VehicleManagement

final class SortVehiculesTests: XCTestCase {
    var repository: VehiculeRepositorySpy!

    override func setUp() {
        super.setUp()
        repository = VehiculeRepositorySpy()
    }

    func testSortCarsByYearDescending() {
        let sortedCars = repository.mockVehicules.sorted { $0.year > $1.year }

        XCTAssertEqual(sortedCars.first?.year, 2022)
        XCTAssertEqual(sortedCars.last?.year, 2021)
    }
}
