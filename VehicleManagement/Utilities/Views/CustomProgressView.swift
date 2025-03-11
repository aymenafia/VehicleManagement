//
//  CustomProgressView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 09.03.25.
//

import SwiftUI

// MARK: - Custom Progress View

struct CustomProgressView: View {
    
    // MARK: - Properties
    
    @Binding var show: Bool
    
    // MARK: - Body
    
    var body: some View {
        if show {
            GeometryReader { geometry in
                ZStack {
                    Color.black.opacity(0.2)
                        .edgesIgnoringSafeArea(.all)
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5) 
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    CustomProgressView(show: .constant(true))
}
