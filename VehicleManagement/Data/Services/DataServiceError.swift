//
//  DataServiceError.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//
import Foundation

// MARK: - Data Service Error

enum DataServiceError: Error, CustomStringConvertible, Identifiable {
    
    case decodingError(String)
    case encodingError(String)
    case networkError(String)
    
    var id: String { description }
    
    var description: String {
        switch self {
        case .decodingError(let message): return "Decoding Error: \(message)"
        case .encodingError(let message): return "Encoding Error: \(message)"
        case .networkError(let message): return "Network Error: \(message)"
        }
    }
}

