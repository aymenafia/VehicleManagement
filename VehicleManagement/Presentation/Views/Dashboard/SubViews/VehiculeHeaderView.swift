//
//  VehiculeHeaderView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//

import SwiftUI

// MARK: - Vehicule Header View

struct VehiculeHeaderView: View {
    
    // MARK: - Properties
    
    let vehicule: Vehicule
    
    let switchAction: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            vehicleDetails
            Spacer()
            switchCarButton
        }
        .padding()
    }
    
    // MARK: - Vehicle Details
    
    private var vehicleDetails: some View {
        VStack(alignment: .leading) {
            Text("\(vehicule.brand) - \(vehicule.series)")
                .title()
                .foregroundColor(.white)
            
            Text("\(String(vehicule.year)) - \(vehicule.fuelType.localizedString)")
                .body2()
                .foregroundColor(.white)
        }
    }
    
    // MARK: - Switch Car Button
    
    private var switchCarButton: some View {
        Button(action: switchAction) {
            Image("SwitchCar")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 40, maxHeight: 40)
        }
    }
}

// MARK: - Preview

struct VehiculeHeaderView_Previews: PreviewProvider {
    static let sampleVehicule = Vehicule(
        brand: "Tesla",
        series: "Model S",
        year: 2022,
        fuelType: .hybrid,
        supportedFeatures: ["Autopilot", "Full Self-Driving"]
    )
    
    static var previews: some View {
        Group {
            VehiculeHeaderView(vehicule: sampleVehicule, switchAction: {
                print("Switch Car button tapped")
            })
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
            
            VehiculeHeaderView(vehicule: sampleVehicule, switchAction: {
                print("Switch Car button tapped")
            })
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
