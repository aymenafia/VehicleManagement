//
//  VehiculeStore.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import Combine
import Foundation

final class VehiculeStore: ObservableObject {
    

    @Published var savedVehicules: [Vehicule] = []
    @Published var selectedVehicule: Vehicule?
    @Published var error: DataServiceError?
    
    private let repository: VehiculeRepositoryProtocol
    private let selectionRepository: VehiculeSelectionServiceProtocol
    private let logger: LoggerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    
    ///
    /// - Parameters:
    ///   - repository: The repository handling vehicule storage (defaults to `VehiculeRepository`).
    ///   - selectionRepository: The repository tracking the selected vehicule (defaults to `VehiculeSelectionRepository`).
    ///   - logger: Logging utility (defaults to `AppLogger`).
    init(
        repository: VehiculeRepositoryProtocol = VehiculeRepository(),
        selectionRepository: VehiculeSelectionServiceProtocol = VehiculeSelectionService(),
        logger: LoggerProtocol = AppLogger()
    ) {
        self.repository = repository
        self.selectionRepository = selectionRepository
        self.logger = logger
        loadVehicules()
    }
    

    func loadVehicules() {
        do {
            // Retrieve saved vehicles
            savedVehicules = try repository.loadVehicules()
            logger.log("Loaded \(savedVehicules.count) vehicules.", type: .info)
            
            // Restore the previously selected vehicle.
            if let savedVehiculeID = selectionRepository.loadSelectedVehiculeID(),
               let vehicule = savedVehicules.first(where: { $0.id.uuidString == savedVehiculeID }) {
                selectedVehicule = vehicule
            } else {
                // Fallback to select the last saved vehicule
                selectedVehicule = savedVehicules.last
                if let vehicule = selectedVehicule {
                    selectionRepository.saveSelectedVehiculeID(vehicule.id.uuidString)
                }
            }
        } catch {
            let errMsg = "Error loading vehicules: \(error)"
            logger.log(errMsg, type: .error)
            self.error = error as? DataServiceError ?? DataServiceError.networkError(errMsg)
            savedVehicules = []
            selectedVehicule = nil
        }
    }
    
    func addVehicule(_ vehicule: Vehicule) {
        savedVehicules.append(vehicule)
        selectVehicule(vehicule)
        
        do {
            try repository.saveVehicules(savedVehicules)
            logger.log("Saved \(savedVehicules.count) vehicules.", type: .info)
        } catch {
            let errMsg = "Error saving vehicule: \(error)"
            logger.log(errMsg, type: .error)
            self.error = DataServiceError.encodingError(errMsg)
        }
    }
    
    func updateVehicules(_ vehicules: [Vehicule]) {
        savedVehicules = vehicules
        if let vehicule = savedVehicules.last {
            selectVehicule(vehicule)
        } else {
            selectedVehicule = nil
            selectionRepository.clearSelectedVehiculeID()
        }
        
        do {
            try repository.saveVehicules(vehicules)
            logger.log("Updated vehicules.", type: .info)
        } catch {
            let errMsg = "Error updating vehicules: \(error)"
            logger.log(errMsg, type: .error)
            self.error = DataServiceError.encodingError(errMsg)
        }
    }
    
    func selectVehicule(_ vehicule: Vehicule) {
        selectedVehicule = vehicule
        selectionRepository.saveSelectedVehiculeID(vehicule.id.uuidString)
        logger.log("Selected vehicule: \(vehicule.brand) \(vehicule.series) \(vehicule.year)", type: .info)
    }
}
