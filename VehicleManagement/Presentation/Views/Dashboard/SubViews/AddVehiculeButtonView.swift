//
//  AddVehiculeButtonView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//

import SwiftUI

// MARK: - Add Vehicule Button View

struct AddVehiculeButtonView: View {
    
    // MARK: - Properties
    
    let action: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action) {
            addCarImage
        }
    }
    
    // MARK: - Add Car Image
    
    private var addCarImage: some View {
        Image("AddCar")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 80, maxHeight: 80)
    }
}

// MARK: - Preview

struct AddVehiculeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddVehiculeButtonView {
                print("Add Car button tapped")
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
            
            AddVehiculeButtonView {
                print("Add Car button tapped")
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
