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
    
    @Published var scanRequest: AnalysisRequest?
    @Published var scanResult: AnalysisModel?
    
    static func processScannedData(scannedData: [ScanData]) -> [String] {
        if scannedData.isEmpty { return [] }
        
        let combinedIngredients = scannedData.map({ $0.content.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "[^a-zA-Z0-9, ]", with: "", options: .regularExpression) })
        let splittedIngredients = combinedIngredients.map({ $0.components(separatedBy: ",") })
        let flatArray = splittedIngredients.flatMap { $0 }
        
        return flatArray
    }
    
    func getAnalysis() {
        guard let scanRequest = self.scanRequest else {return }
        analyzerRepository.getAnalysis(request: scanRequest) { response in
            switch response {
            case .success(let data):
                self.scanResult = data
            case .failure(let error):
                print(error)
                print(response)
            }
        }
    }
    
    init(scannedData: [ScanData]) {
        self.scannedIngredients = ScanResultViewModel.processScannedData(scannedData: scannedData)
        
        if let userData = CoreDataManager.shared.fetchUserData().first {
            let skinConcerns = userData.skinConcerns?.allObjects as [PersonalizationData]
            let skinTypes = userData.skinTypes?.allObjects as [PersonalizationData]
            let allergens = userData.allergens?.allObjects as [PersonalizationData]
            
            self.scanRequest = AnalysisRequest(
                ingredients: self.scannedIngredients.joined(separator: ","),
                concerns: skinConcerns.map({$0.name ?? ""}),
                skinTypes: skinTypes.map({$0.name ?? ""})
            )
            
            print(scanRequest)
            
            if(!self.scannedIngredients.isEmpty) {
                getAnalysis()
            }
        }
    }
}
