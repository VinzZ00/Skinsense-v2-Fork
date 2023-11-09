//
//  IngredientsResultViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import Foundation

class ScanResultViewModel: ObservableObject {
    var scannedData: [ScanData]
    
    init(scannedData: [ScanData]) {
        self.scannedData = scannedData
    }
}
