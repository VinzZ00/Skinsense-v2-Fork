//
//  ScanTab.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI

struct ScanTabTutorialItem {
    var text: String
    var icon: String
}

enum ScanPageSelection {
    case result
}

struct ScanTabView: View {
    @StateObject private var viewModel: ScanTabViewModel = ScanTabViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                viewModel.makeScannerView()
            }
            .sheet(isPresented: $viewModel.isSheetOpened, content: {
                ScanTabSheetView(viewModel: viewModel)
            })
            .navigationDestination(for: ScanPageSelection.self) {
                page in
                switch page {
                case .result:
                    ScanResultView(
                        viewModel: ScanResultViewModel(
                            scannedData: viewModel.texts
                        )
                    )
                }
            }
        }
    }
}

struct ScanTabSheetView: View {
    @ObservedObject var viewModel: ScanTabViewModel
    
    var scanTabSheetTutorialItems : [ScanTabTutorialItem] = [
        ScanTabTutorialItem(text: "Allow access to the camera", icon: "camera.fill"),
        ScanTabTutorialItem(text: "Follow the on-screen instructions", icon: "list.clipboard.fill"),
        ScanTabTutorialItem(text: "Scan ingredients products easily", icon: "camera.viewfinder"),
        ScanTabTutorialItem(text: "If the result is blurred, tap 'Retake'", icon: "arrow.triangle.2.circlepath.circle.fill"),
        ScanTabTutorialItem(text: "Tap 'See Results' to get ingredients detail analysis", icon: "bubbles.and.sparkles.fill"),
    ]
    
    var body: some View {
        VStack {
            Text("How to Use Scan")
                .font(.largeTitle)
                .bold()
            
            Spacer()
                .frame(height: 40)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(scanTabSheetTutorialItems, id:\.text) {
                    item in
                    
                    HStack(spacing: 16) {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.mediumPurple)
                        
                        Text(item.text)
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                }
            }
            
            Spacer()
            
            CustomButton(title: "Continue") {
                viewModel.isSheetOpened = false
            }
        }
        .padding(.top, 32)
        .padding()
    }
}

#Preview {
    ScanTabView()
}
