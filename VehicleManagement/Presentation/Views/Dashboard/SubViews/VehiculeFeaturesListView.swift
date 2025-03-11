//
//  VehiculeFeaturesListView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 08.03.25.
//
import SwiftUI

struct VehiculeFeaturesListView: View {
    
    // MARK: - Properties
    
    let features: [String]
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleSection
            featureList
        }
    }
    
    // MARK: - Title Section
    
    private var titleSection: some View {
        Text(LocalizedStringKey(LocalizableKey.DashBoardDiscoverYourCarText.rawValue))
            .foregroundColor(.white)
            .headline()
            .padding(.leading, 20)
    }
    
    // MARK: - Feature List
    
    private var featureList: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(features.indices, id: \.self) { index in
                        featureRow(for: features[index], isLast: index == features.count - 1)
                    }
                }
            }
            .frame(maxHeight: 150)
        }
        .padding()
        .background(gradientBackground)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
        .padding()
    }
    
    // MARK: - Feature Row
    
    private func featureRow(for feature: String, isLast: Bool) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(feature)
                    .foregroundColor(Color("FontLightColor"))
                    .body2()
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color.theme.backgroundDarkColor)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 12, weight: .semibold))
                    )
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            
            if !isLast {
                Divider()
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.7))
            }
        }
    }
    
    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.theme.backgroundLightColor.opacity(1),
                Color.white.opacity(0.09)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

// MARK: - Preview

struct VehiculeFeaturesListView_Previews: PreviewProvider {
    static var previews: some View {
        VehiculeFeaturesListView(features: [
            "Heated seats",
            "Bluetooth Connectivity",
            "Apple CarPlay",
            "Adaptive Cruise Control",
            "Rear Parking Sensors",
            "360-Degree Camera"
        ])
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.black)
    }
}
