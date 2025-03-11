//
//  Untitled.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import SwiftUI

// MARK: - Active Alert Enum

enum ActiveAlert: Identifiable {
    case delete, error(DataServiceError)
    
    var id: String {
        switch self {
        case .delete:
            return "delete"
        case .error(let error):
            return error.description
        }
    }
}

// MARK: - Vehicule List View

struct VehiculeListView: View {
    
    // MARK: - Properties
    
    @ObservedObject var vehiculeStore: VehiculeStore
    @ObservedObject var coordinator: NavigationCoordinator
    
    @State private var activeAlert: ActiveAlert?
    @State private var vehiculeToDelete: Vehicule?
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            vehiculeListSection
            Spacer()
            addVehiculeButton
        }
        .background(Color.theme.backgroundLightColor.edgesIgnoringSafeArea(.all))
        .navigationTitle(
            Text(LocalizedStringKey(LocalizableKey.VehiculeListNavigationBarTitleText.rawValue))
        )
        .title()
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar { backButton }
        .alert(item: $activeAlert, content: alertContent)
    }
    
    private var vehiculeListSection: some View {
        List {
            ForEach(vehiculeStore.savedVehicules) { vehicule in
                VehiculeCellView(
                    vehicule: vehicule,
                    isSelected: vehiculeStore.selectedVehicule?.id == vehicule.id,
                    onTap: {
                        vehiculeStore.selectVehicule(vehicule)
                    },
                    onDelete: {
                        vehiculeToDelete = vehicule
                        activeAlert = .delete
                    }
                )
                .listRowBackground(Color.theme.backgroundLightColor)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var addVehiculeButton: some View {
        AddNewVehiculeButton(
            title: (LocalizedStringKey(LocalizableKey.VehiculeListAddNewCarButton.rawValue))
        ) {
            coordinator.push(.addVehiculeFlow)
        }
        .padding()
    }
    
    private var backButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: { coordinator.pop() }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            }
        }
    }
    
    private func alertContent(for alert: ActiveAlert) -> Alert {
        switch alert {
        case .delete:
            return Alert(
                title: Text(LocalizedStringKey(LocalizableKey.VehiculeListDeletecarAlertTitleButton.rawValue)),
                message: Text(LocalizedStringKey(LocalizableKey.VehiculeListDeletecarAlertButton.rawValue)),
                primaryButton: .destructive(
                    Text(LocalizedStringKey(LocalizableKey.OKText.rawValue)),
                    action: deleteVehicule
                ),
                secondaryButton: .cancel { activeAlert = nil }
            )
        case .error(let error):
            return Alert(
                title: Text(LocalizedStringKey(LocalizableKey.ErrorGeneric.rawValue)),
                message: Text(error.description),
                dismissButton: .default(
                    Text(LocalizedStringKey(LocalizableKey.OKText.rawValue)),
                    action: {
                        activeAlert = nil
                        vehiculeStore.error = nil
                    }
                )
            )
        }
    }
    
    // MARK: - Helper Methods
    
    private func deleteVehicule() {
        guard let vehiculeToDelete = vehiculeToDelete else { return }
        
        if vehiculeStore.selectedVehicule?.id != vehiculeToDelete.id {
            var remainingVehicules = vehiculeStore.savedVehicules
            if let index = remainingVehicules.firstIndex(where: { $0.id == vehiculeToDelete.id }) {
                remainingVehicules.remove(at: index)
                vehiculeStore.updateVehicules(remainingVehicules)
            }
        }
        
        activeAlert = nil
    }
}

// MARK: - Preview

struct VehiculeListView_Previews: PreviewProvider {
    
    static let sampleVehicule1 = Vehicule(
        brand: "Audi",
        series: "A4",
        year: 2010,
        fuelType: .electric,
        supportedFeatures: ["Basic Audio", "Air Conditioning", "Power Steering"]
    )
    
    static let sampleVehicule2 = Vehicule(
        brand: "BMW",
        series: "3 Series",
        year: 2012,
        fuelType: .gasoline,
        supportedFeatures: ["Leather Seats", "Premium Audio"]
    )
    
    static var previewStore: VehiculeStore = {
        let store = VehiculeStore(repository: VehiculeRepository(), logger: AppLogger())
        store.savedVehicules = [sampleVehicule1, sampleVehicule2]
        store.selectedVehicule = sampleVehicule1
        return store
    }()
    
    static var previews: some View {
        let coordinator = NavigationCoordinator()
        NavigationStack {
            VehiculeListView(vehiculeStore: previewStore, coordinator: coordinator)
        }
    }
}
