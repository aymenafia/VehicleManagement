//
//  VehicleDataServiceProtocol.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 11.03.25.
//


import Foundation
import Combine
import os.log

// MARK: - Vehicle Data Service Protocol

protocol VehicleDataServiceProtocol {
    
    /// Loads vehicle data from a network source
    func loadVehicleData() -> AnyPublisher<VehicleData, Error>
}
