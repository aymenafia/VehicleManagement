//
//  DashboardView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import SwiftUI

// MARK: - Dashboard View

struct DashboardView: View {
    
    // MARK: - Properties
    
    @ObservedObject var vehiculeStore: VehiculeStore
    
    @ObservedObject var coordinator: NavigationCoordinator
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            
            DashboardBackgroundView()
            
            VStack {
                
                TopLogoView(imageName: "logo")
                    .padding(.top, 40)
                
                // if a vehicule is selected, show its details
                if let vehicule = vehiculeStore.selectedVehicule {
                    selectedVehiculeView(for: vehicule)
                } else {
                    noVehiculeView
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
        .onAppear {
            debugPrint(vehiculeStore.selectedVehicule?.year ?? "No selected vehicule")
        }
        .alert(item: $vehiculeStore.error, content: alertContent)
    }
    
    // MARK: - Selected Vehicule View
    
    private func selectedVehiculeView(for vehicule: Vehicule) -> some View {
        VStack {
            VehiculeHeaderView(vehicule: vehicule) {
                coordinator.push(.vehiculeList)
            }
            .padding(.horizontal)
            
            Spacer()
            
            VehiculeImageView(imageName: "Car")
            
            Spacer()
            
            // Features list if available
            if !vehicule.supportedFeatures.isEmpty {
                VehiculeFeaturesListView(features: vehicule.supportedFeatures)
                    .padding(.horizontal)
            }
        }
    }
    
    // MARK: - No Vehicule View
    
    private var noVehiculeView: some View {
        VStack {
            Spacer()
            AddVehiculeButtonView {
                coordinator.push(.addVehiculeFlow)
            }
            Spacer()
        }
    }
    
    private func alertContent(for error: DataServiceError) -> Alert {
        Alert(
            title: Text(LocalizedStringKey(LocalizableKey.ErrorGeneric.rawValue)),
            message: Text(error.description),
            dismissButton: .default(Text(LocalizedStringKey(LocalizableKey.OKText.rawValue)), action: {
                vehiculeStore.error = nil
            })
        )
    }
}

// MARK: - Preview

struct DashboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        let sampleVehicule = Vehicule(
            brand: "Audi",
            series: "A4",
            year: 2010,
            model: "S-Line",
            supportedFeatures: ["Basic Audio", "Air Conditioning", "Power Steering"]
        )
        
        let store = VehiculeStore(repository: VehiculeRepository(), logger: AppLogger())
        store.savedVehicules = [sampleVehicule]
        store.selectedVehicule = sampleVehicule
        
        let coordinator = NavigationCoordinator()
        
        return NavigationStack {
            DashboardView(vehiculeStore: store, coordinator: coordinator)
        }
    }
}

// MARK: - GradientListView Preview

struct GradientListView_Previews: PreviewProvider {
    static var previews: some View {
        VehiculeFeaturesListView(features: ["Feature 1", "Feature 2", "Feature 3"])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
