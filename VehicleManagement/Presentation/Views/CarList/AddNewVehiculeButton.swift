//
//  AddNewVehiculeButton.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//

import SwiftUI

// MARK: - Add New Vehicule Button

struct AddNewVehiculeButton: View {
    
    // MARK: - Properties
    
    var title: LocalizedStringKey
    var action: () -> Void
        
    var body: some View {
        Button(action: action) {
            Text(title)
                .title()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(buttonBackground)
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Background
    
    private var buttonBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.theme.secondaryColor, Color.theme.primaryColor]),
            startPoint: .trailing,
            endPoint: .leading
        )
    }
}

// MARK: - Preview

struct AddNewVehiculeButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddNewVehiculeButton(title: "Add New Vehicle", action: {
                print("Button tapped")
            })
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.light)
            
            AddNewVehiculeButton(title: "Add New Vehicle", action: {
                print("Button tapped")
            })
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
