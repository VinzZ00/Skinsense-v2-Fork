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
//        return "http://localhost:3005/"
//        return "https://4bce-158-140-189-122.ngrok-free.app/"
        return "https://api.skinsense.exacode.io/"
    }
}
