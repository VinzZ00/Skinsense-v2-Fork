//
//  IngredientsResultView.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import SwiftUI

struct ScanResultView: View {
    @StateObject var viewModel : ScanResultViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.scannedData) {
                text in
                Text(text.content)
            }
        }
        .navigationTitle("Product Information")
    }
}

#Preview {
    ScanResultView(viewModel: ScanResultViewModel(scannedData: []))
}
