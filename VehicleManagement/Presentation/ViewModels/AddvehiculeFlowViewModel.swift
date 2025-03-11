//
//  AddvehiculeFlowViewModel.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import Foundation
import Combine

// MARK: - Add Vehicule Flow ViewModel

final class AddVehiculeFlowViewModel: ObservableObject {
    
    
    @Published var selectedBrand: Brand?
    @Published var selectedSeries: Series?
    @Published var selectedYear: YearData?
    @Published var selectedVehicleFuelType: FuelType?
    @Published var filteredBrands: [Brand] = []
    @Published var filteredSeries: [Series] = []
    @Published var filteredYears: [YearData] = []
    @Published var filteredFuelTypes: [FuelType] = []
    @Published var error: DataServiceError?
    @Published var isLoading: Bool = false
    
    
    private var cancellables = Set<AnyCancellable>()
    private let vehicleDataService: VehicleDataServiceProtocol
    private let logger: LoggerProtocol
    
    
    ///
    /// - Parameters:
    ///   - vehicleDataService: The service for fetching vehicle data.
    ///   - logger: The logging utility (defaults to `AppLogger`).
    init(
        vehicleDataService: VehicleDataServiceProtocol = NetworkVehicleDataService(
            url: APIConfig.vehicleDataURL,
            networker: NetworkerMock(),
            logger: AppLogger()
        ),
        logger: LoggerProtocol = AppLogger()
    ) {
        self.vehicleDataService = vehicleDataService
        self.logger = logger
    }
    

    func loadData() {
        isLoading = true
        error = nil
        
        vehicleDataService.loadVehicleData()
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    self.logger.log("Error encountered: \(err)", type: .error)
                    self.error = DataServiceError.networkError(err.localizedDescription)
                }
            }, receiveValue: { [weak self] vehicleData in
                self?.filteredBrands = vehicleData.brands.sorted { $0.name < $1.name }
                self?.logger.log("Successfully loaded vehicle data with \(vehicleData.brands.count) brands.", type: .info)
            })
            .store(in: &cancellables)
    }
    
    func selectBrand(_ brand: Brand) {
        selectedBrand = brand
        filteredSeries = brand.series.sorted { $0.name < $1.name }
    }
    

    func selectSeries(_ series: Series) {
        selectedSeries = series
        filteredYears = series.years.sorted { $0.year < $1.year }
    }
    
    func selectYear(_ yearEntry: YearData) {
        selectedYear = yearEntry
        filteredFuelTypes = FuelType.allCases
    }
    
    func selectFuelType(_ fuelType: FuelType) {
        selectedVehicleFuelType = fuelType
    }

    
    func completeSelection() -> Vehicule? {
        guard let brand = selectedBrand,
              let series = selectedSeries,
              let year = selectedYear,
              let fuelType = selectedVehicleFuelType else {
            return nil
        }

        return Vehicule(
            id: UUID(),
            brand: brand.name,
            series: series.name,
            year: year.year,
            fuelType: fuelType,
            supportedFeatures: year.supportedFeatures
        )
    }
}
