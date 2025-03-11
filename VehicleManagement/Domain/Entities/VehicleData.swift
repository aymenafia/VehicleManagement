//
//  VehicleData.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import Foundation

// MARK: - Vehicle Data Model

struct VehicleData: Codable {
    let brands: [Brand]
}

// MARK: - Brand Model

struct Brand: Codable, Equatable, Hashable {
    let name: String
    let series: [Series]
}

// MARK: - Series Model

struct Series: Codable, Equatable, Hashable {
    let name: String
    let years: [YearData]
}

// MARK: - Year Data Model

struct YearData: Codable, Equatable, Hashable {
    let year: Int
    let supportedFeatures: [String]
    
    var availableFuelTypes: [FuelType] {
        return FuelType.allCases
    }
}

// MARK: - CustomStringConvertible Conformance

extension Brand: CustomStringConvertible {
    var description: String { name }
}

extension Series: CustomStringConvertible {
    var description: String { name }
}

extension YearData: CustomStringConvertible {
    var description: String { "\(year)" }
}
