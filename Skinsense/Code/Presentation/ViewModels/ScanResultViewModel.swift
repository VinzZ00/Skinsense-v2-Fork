//
//  IngredientsResultViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import Foundation

class ScanResultViewModel: ObservableObject {
    var scannedIngredients : [String]
    
    static func processScannedData(scannedData: [ScanData]) -> [String] {
        if scannedData.isEmpty { return [] }
        
        let combinedIngredients = scannedData.map({ $0.content.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "[^a-zA-Z0-9, ]", with: "", options: .regularExpression) })
        let splittedIngredients = combinedIngredients.map({ $0.components(separatedBy: ",") })
        let flatArray = splittedIngredients.flatMap { $0 }
        
        return flatArray
    }
    
    init(scannedData: [ScanData]) {
        self.scannedIngredients = ScanResultViewModel.processScannedData(scannedData: scannedData)
        
        print(self.scannedIngredients)
    }
}
