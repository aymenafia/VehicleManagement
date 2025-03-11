//
//  VehiculeRepositoryProtocol.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import Foundation

// MARK: - Vehicle Repository Protocol

protocol VehiculeRepositoryProtocol {
    
    /// Loads all stored vehicles
    func loadVehicules() throws -> [Vehicule]
    
    /// Saves an array of vehicles to storage
    func saveVehicules(_ vehicules: [Vehicule]) throws
}

