//
//  IngredientsResultViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import Foundation

class ScanResultViewModel: ObservableObject {
    private var repository: MockProductRepository = MockProductRepository()
    var scannedIngredients : [String]
    
    @Published var scanResult: ScanResult?
    
    static func processScannedData(scannedData: [ScanData]) -> [String] {
        if scannedData.isEmpty { return [] }
        
        let combinedIngredients = scannedData.map({ $0.content.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "[^a-zA-Z0-9, ]", with: "", options: .regularExpression) })
        let splittedIngredients = combinedIngredients.map({ $0.components(separatedBy: ",") })
        let flatArray = splittedIngredients.flatMap { $0 }
        
        return flatArray
    }
    
    func getAnalysis() {
        repository.fetchData { products in
            self.scanResult = ScanResult(
                goodForSkinType: ["Dry", "Oily"],
                badForSkinType: ["Sensitive"],
                goodFor: ["Redness", "Acne"],
                badFor: ["Dullness"],
                allergens: [],
                incompatibleIngredients: ["Water"], compatibleIngredients: ["Linalool"], additionalInformations: "This is additional information",
                similarProduct: products.first
            )
        }
    }
    
    init(scannedData: [ScanData]) {
        self.scannedIngredients = ScanResultViewModel.processScannedData(scannedData: scannedData)
        
        if(!self.scannedIngredients.isEmpty) {
            getAnalysis()
        }
    }
}
