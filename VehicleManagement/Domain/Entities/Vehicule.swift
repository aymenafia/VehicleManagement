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
    let model: String
    let supportedFeatures: [String]
    
    init(id: UUID = UUID(), brand: String, series: String, year: Int, model: String, supportedFeatures: [String]) {
        self.id = id
        self.brand = brand
        self.series = series
        self.year = year
        self.model = model
        self.supportedFeatures = supportedFeatures
    }
}
