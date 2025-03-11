//
//  View+FontExtension.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 07.03.25.
//

import SwiftUI

// MARK: - Custom Font Extension for FiraSans

/// Provides a custom font extension for SwiftUI views using the FiraSans font family.
public extension View {
    
    /// Applies a FiraSans custom font to the view based on weight and size.
    /// - Parameters:
    ///   - weight: The font weight (default: `.regular`).
    ///   - size: The font size.
    /// - Returns: A view with the specified FiraSans font applied.
    func firaSans(weight: Font.Weight = .regular, size: CGFloat) -> some View {
        switch weight {
        case .medium:
            return self.font(Font.custom("FiraSans-Medium", size: size))
        case .semibold:
            return self.font(Font.custom("FiraSans-SemiBold", size: size))
        case .bold:
            return self.font(Font.custom("FiraSans-Bold", size: size))
        default:
            return self.font(Font.custom("FiraSans-Regular", size: size))
        }
    }
}

// MARK: - Predefined Font Styles

/// Extension providing predefined font styles for consistent typography.
public extension View {
    
    /// Applies a **FiraSans-Bold (size: 20)** for headlines.
    func headline() -> some View {
        return self.firaSans(weight: .bold, size: 20)
    }
    
    /// Applies a **FiraSans-Bold (size: 18)** for titles.
    func title() -> some View {
        return self.firaSans(weight: .bold, size: 18)
    }
    
    /// Applies a **FiraSans-SemiBold (size: 16)** for subtitles.
    func subtitle() -> some View {
        return self.firaSans(weight: .semibold, size: 16)
    }
    
    /// Applies a **FiraSans-Medium (size: 14)** for primary body text.
    func body1() -> some View {
        return self.firaSans(weight: .medium, size: 14)
    }
    
    /// Applies a **FiraSans-Regular (size: 14)** for secondary body text.
    func body2() -> some View {
        return self.firaSans(weight: .regular, size: 14)
    }
    
    /// Applies a **FiraSans-Regular (size: 12)** for captions.
    func caption() -> some View {
        return self.firaSans(weight: .regular, size: 12)
    }
    
    /// Applies a **FiraSans-Medium (size: 12)** for overline text.
    func overline() -> some View {
        return self.firaSans(weight: .medium, size: 12)
    }
}
