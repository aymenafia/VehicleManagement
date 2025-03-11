//
//  Vehicule.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import Foundation

// MARK: - Models

struct Vehicule: Identifiable, Codable, Equatable {
    let id: UUID
    let brand: String
    let series: String
    let year: Int
    let fuelType: FuelType
    let supportedFeatures: [String]
    
    init(id: UUID = UUID(), brand: String, series: String, year: Int, fuelType: FuelType, supportedFeatures: [String]) {
        self.id = id
        self.brand = brand
        self.series = series
        self.year = year
        self.fuelType = fuelType
        self.supportedFeatures = supportedFeatures
    }
}
