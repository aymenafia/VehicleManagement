//
//  VehiculeStorageService.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

// MARK: - Services

import Foundation
import os.log

// MARK: - Vehicule Storage Service Protocol

protocol VehiculeStorageServiceProtocol {
    
    /// Loads all stored vehicles from persistent storage
    func loadSavedVehicules() throws -> [Vehicule]
    
    /// Saves an array of vehicles to persistent storage
    func saveVehicules(_ vehicules: [Vehicule]) throws
}

// MARK: - Vehicule Storage Service

final class VehiculeStorageService: VehiculeStorageServiceProtocol {
    
    private let storageKey = "SavedCars"
    private let logger: LoggerProtocol
    
    init(logger: LoggerProtocol = AppLogger()) {
        self.logger = logger
    }
    
    func loadSavedVehicules() throws -> [Vehicule] {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            logger.log("No saved vehicules found.", type: .info)
            return [] 
        }
        
        do {
            let vehicules = try JSONDecoder().decode([Vehicule].self, from: data)
            logger.log("Loaded \(vehicules.count) vehicules from storage.", type: .info)
            return vehicules
        } catch {
            let errorMsg = "Failed to decode saved vehicules: \(error)"
            logger.log(errorMsg, type: .error)
            throw DataServiceError.decodingError(errorMsg)
        }
    }
    
    func saveVehicules(_ vehicules: [Vehicule]) throws {
        do {
            let data = try JSONEncoder().encode(vehicules)
            UserDefaults.standard.set(data, forKey: storageKey)
            logger.log("Saved \(vehicules.count) vehicules.", type: .info)
        } catch {
            let errorMsg = "Failed to encode vehicules for storage: \(error)"
            logger.log(errorMsg, type: .error)
            throw DataServiceError.encodingError(errorMsg)
        }
    }
}
