//
//  TopLogoView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//

import SwiftUI

// MARK: - Top Logo View

struct TopLogoView: View {
    
    // MARK: - Properties
    
    let imageName: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Spacer()
            logoImage
            Spacer()
        }
    }
    
    // MARK: - Logo Image
    
    private var logoImage: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 100, maxHeight: 100)
    }
}

// MARK: - Preview

struct TopLogoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopLogoView(imageName: "AppLogo")
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
            
            TopLogoView(imageName: "AppLogo")
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
