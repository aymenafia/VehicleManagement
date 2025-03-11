//
//  Color+CarlyColor.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 09.03.25.
//

import SwiftUI

// MARK: - Color Extension

extension Color {
    
    static let theme = ColorTheme()
}

// MARK: - Color Theme Struct

struct ColorTheme {
    
    let backgroundDarkColor = Color("BackgroundDarkColor")
    
    let backgroundLightColor = Color("BackgroundLightColor")
    
    let fontDarkColor = Color("FontDarkColor")
    
    let fontLightColor = Color("FontLightColor")
    
    let primaryColor = Color("PrimaryColor")
    
    let secondaryColor = Color("SecondaryColor")
}
