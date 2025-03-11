//
//  NavigationCoordinator.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//
import SwiftUI

// MARK: - Route Enum

enum Route: Hashable {
    case vehiculeList       // Navigates to the list of saved vehicles
    case addVehiculeFlow    // Navigates to the "Add New Vehicle" flow
}

// MARK: - Navigation Coordinator

final class NavigationCoordinator: ObservableObject {
        
    /// Represents the current navigation stack.
    @Published var path = NavigationPath()
    

    /// The destination to navigate to
    func push(_ route: Route) {
        path.append(route)
    }
    
    /// Pops the last route from the navigation stack
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// Pops all routes, returning to the root screen
    func popToRoot() {
        path.removeLast(path.count)
    }
}
