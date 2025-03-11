//
//  LocalizedStringKey+LocalizableKey.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 09.03.25.
//

import SwiftUI

// MARK: - Localizable Keys

enum LocalizableKey: String {
    
    // MARK: - Common Strings
    
    case ErrorDescription
    case ErrorGeneric
    case errorViewRetryButton
    case OKText

    // MARK: - Dashboard Screen
    
    case DashBoardDiscoverYourCarText
    
    // MARK: - Vehicule List Screen
    
    case VehiculeListAddNewCarButton
    case VehiculeListNavigationBarTitleText
    case VehiculeListDeletecarAlertButton
    case VehiculeListDeletecarAlertTitleButton

    // MARK: - Vehicule Creation Flow
    
    case VehiculeCreationFlowNavigationBarTitleText
    case VehiculeCreationFlowSearchBarModelText
    case VehiculeCreationFlowSearchBarBuildYearText
    case VehiculeCreationFlowSearchBarBrandYearText
    case VehiculeCreationFlowSearchBarFallbackYearText
}

// MARK: - Localized String Key Extension

extension LocalizedStringKey {
    
    static func localized(_ key: String) -> LocalizedStringKey {
        return LocalizedStringKey(key)
    }
}
