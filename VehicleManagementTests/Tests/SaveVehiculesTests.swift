//
//  SaveVehiculesTests.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//

import XCTest
@testable import VehicleManagement

final class SaveVehiculesTests: XCTestCase {
    var repository: VehiculeRepositorySpy!

    override func setUp() {
        super.setUp()
        repository = VehiculeRepositorySpy()
    }

    func testSaveVehicules() {
        let newVehicule = Vehicule(brand: "Audi", series: "A4", year: 2023, fuelType: .diesel, supportedFeatures: ["Bluetooth"])
        repository.saveVehicules([newVehicule])

        XCTAssertEqual(repository.mockVehicules.count, 1)
        XCTAssertEqual(repository.mockVehicules.first?.brand, "Audi")
    }
}
