//
//  VehiculeSelectionRepository.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//

import Foundation

// MARK: - Vehicule Selection Repository Protocol

protocol VehiculeSelectionServiceProtocol {
    
    /// Loads the ID of the currently selected vehicle
    func loadSelectedVehiculeID() -> String?
    
    /// Saves the ID of the selected vehicle
    func saveSelectedVehiculeID(_ id: String)
    
    /// Clears the currently selected vehicle ID from storage
    func clearSelectedVehiculeID()
}

// MARK: - Vehicule Selection Repository

final class VehiculeSelectionService: VehiculeSelectionServiceProtocol {
    
    
    ///  key used to store the selected vehicle ID
    private let key = "SelectedCarID"
    
    func loadSelectedVehiculeID() -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    func saveSelectedVehiculeID(_ id: String) {
        UserDefaults.standard.set(id, forKey: key)
    }
    
    func clearSelectedVehiculeID() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
