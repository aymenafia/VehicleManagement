//
//  FuelType.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation

// MARK: - FuelType

enum FuelType: String, CaseIterable, Codable, CustomStringConvertible {
    case gasoline = "fuelType.gasoline"
    case diesel = "fuelType.diesel"
    case hybrid = "fuelType.hybrid"
    case electric = "fuelType.electric"
    case other = "fuelType.other"

    var localizedString: String {
        NSLocalizedString(self.rawValue, comment: "")
    }

    var description: String {
        localizedString
    }
}
