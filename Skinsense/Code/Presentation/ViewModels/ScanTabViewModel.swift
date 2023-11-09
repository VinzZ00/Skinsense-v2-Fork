//
//  ScanTabViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import Foundation

class ScanTabViewModel: ObservableObject {
    @Published var isSheetOpened = true
    @Published var showScannerSheet: Bool = false
    @Published var texts : [ScanData] = []
    @Published var isScanning: Bool = true
    
    func makeScannerView() -> ScannerView {
        ScannerView { textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.isScanning = false
        }
    }
}
