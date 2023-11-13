//
//  ConfigurationManager.swift
//  Skinsense
//
//  Created by Rainer Regan on 12/11/23.
//

import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()

    private init() {}

    func apiBaseUrl() -> String {
        // Logic to read the base URL from a file or another source
        return "https://8daf-103-136-59-166.ngrok-free.app/"
    }
}
