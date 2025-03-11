//
//  APIConfig.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation

// MARK: - API Configuration

struct APIConfig {

    /// The endpoint for fetching vehicle data from the server
    static let vehicleDataURL: URL = {
        guard let url = URL(string: "https://api.carly.com/vehicledata") else {
            fatalError("Invalid URL for vehicle data. Check your configuration.")
        }
        return url
    }()
}
