//
//  VehiculeCellView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import SwiftUI

// MARK: - Vehicule Cell View

struct VehiculeCellView: View {
    
    // MARK: - Properties
    
    let vehicule: Vehicule
    
    let isSelected: Bool
    
    let onTap: () -> Void
    
    let onDelete: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            vehicleDetails
            Spacer()
            if !isSelected { deleteButton }
        }
        .padding()
        .background(Color.theme.backgroundDarkColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .contentShape(RoundedRectangle(cornerRadius: 8))
        .overlay(selectionBorder)
        .onTapGesture(perform: onTap)
    }
    
    private var vehicleDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(vehicule.brand) \(vehicule.series)")
                .body1()
                .foregroundColor(Color.theme.fontLightColor)
            Text("\(String(vehicule.year)) - \(vehicule.fuelType.localizedString)")
                .caption()
                .foregroundColor(Color.theme.fontDarkColor)
        }
    }
    
    private var deleteButton: some View {
        Button(action: onDelete) {
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundColor(.white)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
    
    private var selectionBorder: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(isSelected ? Color.theme.primaryColor : Color.clear, lineWidth: 3)
    }
}

// MARK: - Preview

struct VehiculeCellView_Previews: PreviewProvider {
    static let sampleVehicule = Vehicule(
        brand: "BMW",
        series: "3 Series",
        year: 2010,
        fuelType: .diesel,
        supportedFeatures: ["Leather Seats", "Premium Audio"]
    )
    
    static var previews: some View {
        VStack(spacing: 20) {
            VehiculeCellView(
                vehicule: sampleVehicule,
                isSelected: true,
                onTap: { print("Selected Vehicule cell tapped") },
                onDelete: { print("Delete tapped") }
            )
            VehiculeCellView(
                vehicule: sampleVehicule,
                isSelected: false,
                onTap: { print("Vehicule cell tapped") },
                onDelete: { print("Delete tapped") }
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
