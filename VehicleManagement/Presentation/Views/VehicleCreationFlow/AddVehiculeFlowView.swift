//
//  AddVehiculeFlowView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//
import SwiftUI

// MARK: - Add Vehicule Flow View

struct AddVehiculeFlowView: View {
    
    // MARK: - Properties
    
    var onComplete: (Vehicule) -> Void

    @StateObject private var viewModel = AddVehiculeFlowViewModel()
    
    @State private var currentStep = 1
    
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    private var searchPlaceholder: String {
        switch currentStep {
        case 1, 2:
            return NSLocalizedString(LocalizableKey.VehiculeCreationFlowSearchBarBrandYearText.rawValue, comment: "")
        case 3:
            return NSLocalizedString(LocalizableKey.VehiculeCreationFlowSearchBarBuildYearText.rawValue, comment: "")
        case 4:
            return NSLocalizedString(LocalizableKey.VehiculeCreationFlowSearchBarModelText.rawValue, comment: "")
        default:
            return NSLocalizedString(LocalizableKey.VehiculeCreationFlowSearchBarFallbackYearText.rawValue, comment: "")
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            stepContent
            Spacer()
        }
        .background(Color.theme.backgroundLightColor.edgesIgnoringSafeArea(.all))
        .alert(item: $viewModel.error) { error in errorAlert(error) }
        .onDisappear { viewModel.error = nil }
        .onAppear { viewModel.loadData() }
        .navigationBarBackButtonHidden(true)
        .toolbar { backButton }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationTitle(
            NSLocalizedString(LocalizableKey.VehiculeCreationFlowNavigationBarTitleText.rawValue, comment: "")
        )
        .title()
        .overlay { CustomProgressView(show: $viewModel.isLoading) }
    }

    @ViewBuilder
    private var stepContent: some View {
        switch currentStep {
        case 1:
            brandSelectionView
        case 2:
            seriesSelectionView
        case 3:
            yearSelectionView
        case 4:
            modelSelectionView
        default:
            EmptyView()
        }
    }

    // MARK: - Step 1: Brand Selection
    
    private var brandSelectionView: some View {
        SelectionListView(
            title: "",
            items: viewModel.filteredBrands,
            onSelect: { brand in
                viewModel.selectBrand(brand)
                currentStep = 2
            },
            placeholder: searchPlaceholder
        )
    }

    // MARK: - Step 2: Series Selection
    
    @ViewBuilder
    private var seriesSelectionView: some View {
        if let brand = viewModel.selectedBrand {
            SelectionListView(
                title: brand.name,
                items: viewModel.filteredSeries,
                onSelect: { series in
                    viewModel.selectSeries(series)
                    currentStep = 3
                },
                placeholder: searchPlaceholder
            )
        } else {
            EmptyView()
        }
    }

    // MARK: - Step 3: Year Selection
    
    @ViewBuilder
    private var yearSelectionView: some View {
        if let brand = viewModel.selectedBrand, let series = viewModel.selectedSeries {
            SelectionListView(
                title: "\(brand.name), \(series.name)",
                items: viewModel.filteredYears,
                onSelect: { year in
                    viewModel.selectYear(year)
                    currentStep = 4
                },
                placeholder: searchPlaceholder
            )
        } else {
            EmptyView()
        }
    }

    // MARK: - Step 4: Fuel Type Selection
    
    @ViewBuilder
    private var modelSelectionView: some View {
        if let brand = viewModel.selectedBrand,
           let series = viewModel.selectedSeries,
           let year = viewModel.selectedYear {
            SelectionListView(
                title: "\(brand.name), \(series.name), \(year.description)",
                items: viewModel.filteredFuelTypes,
                onSelect: { fuelType in
                    viewModel.selectFuelType(fuelType)
                    if let newVehicule = viewModel.completeSelection() {
                        onComplete(newVehicule)
                        coordinator.popToRoot()
                    }
                },
                placeholder: searchPlaceholder
            )
        } else {
            EmptyView()
        }
    }

    
    private func errorAlert(_ error: DataServiceError) -> Alert {
        Alert(
            title: Text(LocalizedStringKey(LocalizableKey.ErrorGeneric.rawValue)),
            message: Text(error.description),
            primaryButton: .default(
                Text(LocalizedStringKey(LocalizableKey.errorViewRetryButton.rawValue)),
                action: {
                    viewModel.error = nil
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        viewModel.loadData()
                    }
                }
            ),
            secondaryButton: .cancel { viewModel.error = nil }
        )
    }

    private var backButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                if currentStep > 1 {
                    currentStep -= 1
                } else {
                    coordinator.pop()
                }
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Preview

struct AddVehiculeFlowView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinator = NavigationCoordinator()
        NavigationStack {
            AddVehiculeFlowView { newVehicule in
                print("New Vehicule Added: \(newVehicule)")
            }
            .environmentObject(coordinator)
        }
    }
}
