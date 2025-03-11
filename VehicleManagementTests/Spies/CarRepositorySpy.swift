//
//  CarRepositorySpy.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//

import XCTest
@testable import VehicleManagement

final class VehiculeRepositorySpy: VehiculeRepositoryProtocol {
    var mockVehicules: [Vehicule] = [
        Vehicule(brand: "BMW", series: "M3", year: 2021, fuelType: .diesel, supportedFeatures: ["Heated Seats"]),
        Vehicule(brand: "Tesla", series: "Model 3", year: 2022, fuelType: .diesel, supportedFeatures: ["Autopilot"])
    ]

    func loadVehicules() -> [Vehicule] {
        return mockVehicules
    }

    func saveVehicules(_ vehicules: [Vehicule]) {
        mockVehicules = vehicules
    }
}
