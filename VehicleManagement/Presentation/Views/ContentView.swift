//
//  ContentView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 05.03.25.
//

import SwiftUI

// MARK: - Content View

struct ContentView: View {
    
    // MARK: - Properties
    
    @StateObject var vehiculeStore = VehiculeStore()
    
    @StateObject var coordinator = NavigationCoordinator()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            DashboardView(vehiculeStore: vehiculeStore, coordinator: coordinator)
                .navigationDestination(for: Route.self, destination: destinationView)
        }
        .tint(.white)
        .environmentObject(coordinator)
        .alert(item: $vehiculeStore.error, content: alertContent)
    }
    
    // MARK: - Destination View

    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .vehiculeList:
            VehiculeListView(vehiculeStore: vehiculeStore, coordinator: coordinator)
        case .addVehiculeFlow:
            AddVehiculeFlowView { newVehicule in
                vehiculeStore.addVehicule(newVehicule)
            }
            .environmentObject(coordinator)
        }
    }
    
    // MARK: - Alert Handling
    
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

#Preview {
    ContentView()
}
