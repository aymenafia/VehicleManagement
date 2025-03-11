//
//  VehiculeImageView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//

import SwiftUI

// MARK: - Vehicule Image View

struct VehiculeImageView: View {
    
    // MARK: - Properties
    
    let imageName: String
    
    // MARK: - Body
    
    var body: some View {
        vehicleImage
    }
    
    // MARK: - Vehicle Image
    
    private var vehicleImage: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 300, maxHeight: 300)
    }
}

// MARK: - Preview

struct VehiculeImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VehiculeImageView(imageName: "SampleCarImage")
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
            
            VehiculeImageView(imageName: "SampleCarImage")
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
