//
//  VehiculeRepository.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import Foundation

// MARK: - Vehicule Repository

final class VehiculeRepository: VehiculeRepositoryProtocol {
    
    
    private let storageService: VehiculeStorageServiceProtocol
    

    init(storageService: VehiculeStorageServiceProtocol = VehiculeStorageService()) {
        self.storageService = storageService
    }
    
    func loadVehicules() throws -> [Vehicule] {
        return try storageService.loadSavedVehicules()
    }
    
    func saveVehicules(_ vehicules: [Vehicule]) throws {
        try storageService.saveVehicules(vehicules)
    }
}
