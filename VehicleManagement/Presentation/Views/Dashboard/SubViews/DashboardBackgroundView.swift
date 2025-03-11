//
//  DashboardBackgroundView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//
import SwiftUI

// MARK: - Dashboard Background View
struct DashboardBackgroundView: View {
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            baseBackground
            topImageBackground
        }
    }
    
    // MARK: - Base Background
    
    /// The primary background color that fills the entire screen.
    private var baseBackground: some View {
        Color.theme.backgroundLightColor
            .ignoresSafeArea()
    }
    
    // MARK: - Top Image Background
    
    private var topImageBackground: some View {
        Image("DBImage")
            .resizable()
            .scaledToFill()
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height * 0.8
            )
            .clipped()
    }
}

// MARK: - Preview

struct DashboardBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardBackgroundView()
            .previewLayout(.sizeThatFits)
            .background(Color.black)
        
    }
}
