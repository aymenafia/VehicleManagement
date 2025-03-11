//
//  FuelType.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation

// MARK: - FuelType Enum

enum FuelType: String, CaseIterable, Codable, CustomStringConvertible {
    
    // MARK: - Cases
    
    case gasoline = "Gasoline"
    case diesel = "Diesel"
    case hybrid = "Hybrid"
    case electric = "Electric"
    case other = "Other"
    
    // MARK: - Properties
    
    var description: String {
        rawValue
    }
}
