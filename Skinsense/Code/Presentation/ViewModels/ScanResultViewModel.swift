//
//  IngredientsResultViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import Foundation

class ScanResultViewModel: ObservableObject {
    private var repository: MockProductRepository = MockProductRepository()
    private var analyzerRepository: AnalyzerRepository = AnalyzerRepository()
    
    var scannedIngredients : [String]
    
    @Published var scanResult: AnalysisModel?
    
    static func processScannedData(scannedData: [ScanData]) -> [String] {
        if scannedData.isEmpty { return [] }
        
        let combinedIngredients = scannedData.map({ $0.content.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "[^a-zA-Z0-9, ]", with: "", options: .regularExpression) })
        let splittedIngredients = combinedIngredients.map({ $0.components(separatedBy: ",") })
        let flatArray = splittedIngredients.flatMap { $0 }
        
        return flatArray
    }
    
    func getAnalysis() {
        let request: AnalysisRequest = AnalysisRequest(ingredients: scannedIngredients.joined(separator: ","), concerns: ["Redness"], skinTypes: ["Dry"])
        
        analyzerRepository.getAnalysis(request: request) { response in
            switch response {
            case .success(let data):
                self.scanResult = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    init(scannedData: [ScanData]) {
        self.scannedIngredients = ScanResultViewModel.processScannedData(scannedData: scannedData)
        
        if(!self.scannedIngredients.isEmpty) {
            getAnalysis()
        }
    }
}
