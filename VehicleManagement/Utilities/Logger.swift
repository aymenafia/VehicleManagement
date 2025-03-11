//
//  Logger.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import Foundation
import os.log

// MARK: - Logger Protocol

protocol LoggerProtocol {
    
    func log(_ message: String, type: OSLogType)
}

// MARK: - Application Logger

struct AppLogger: LoggerProtocol {
    
    /// Logs a message with a given severity level.
    ///
    /// - Parameters:
    ///   - message: The log message.
    ///   - type: The severity level (e.g., `.info`, `.error`, `.debug`).
    func log(_ message: String, type: OSLogType = .default) {
        os_log(
            "%@",
            log: OSLog(subsystem: Bundle.main.bundleIdentifier ?? "VehiculeManagementApp", category: "App"),
            type: type,
            message
        )
    }
}

