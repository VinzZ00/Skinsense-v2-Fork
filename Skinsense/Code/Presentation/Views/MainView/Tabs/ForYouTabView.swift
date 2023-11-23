//
//  ForYouTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 11/11/23.
//

import SwiftUI
import WrappingHStack

struct ForYouTabView: View {
    @Environment(\.isSearching) private var isSearching
    
    @StateObject var viewModel: ForYouTabViewModel = ForYouTabViewModel()
    
    var body: some View {
        NavigationView {
            ForYouView(viewModel: viewModel)
                .navigationTitle("For You")
                .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search skincare product")
                .autocorrectionDisabled()
                .onChange(of: viewModel.searchText) { newValue in
                    if newValue != "" {
                        viewModel.searchProduct(query: newValue)
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct ForYouView: View {
    @Environment(\.isSearching) private var isSearching
    @ObservedObject var viewModel: ForYouTabViewModel
    let decoder = JSONDecoder()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if (isSearching) {
            if(viewModel.searchText.isEmpty) {
                ScrollView {
                    VStack {
                        HStack {
                            Text("Recently viewed Product")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Button {
                                viewModel.clearProductHistory()
                            } label: {
                                Text("Clear")
                            }
                        }
                        
                        if let productHistory = viewModel.productHistory {
                            VStack {
                                ForEach(productHistory) {
                                    history in
                                    ProductHistoryItem(productHistory: history)
                                }
                            }
                            
                        } else {
                            VStack {
                                Text("No history")
                            }
                            .padding()
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .onAppear {
                    viewModel.fetchProductHistory()
                }
            } else  {
                if viewModel.isLoading {
                    VStack(spacing: 16) {
                        ProgressView()
                        Text("Searching...")
                            .font(.caption)
                    }
                } else {
                    if viewModel.searchedProduct.isEmpty {
                        CustomEmptyView(title: "Not Found", subTitle: "for \(viewModel.searchText)",withImage: false)
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.searchedProduct, id: \.id) {
                                    product in
                                    ProductSearchListItem(product: product)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Your personalized product")
                            .font(.title3)
                            .bold()
                        
                        LazyVGrid (columns: columns) {
                            ForEach(AppConstants.categoryGroups, id: \.id) {
                                group in
                                PersonalizedProductIcon(categoryGroup: group, icon: group.icon ?? "Others")
                            }
                            
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recently Scanned")
                            .font(.title3)
                            .bold()
                        
                        if let scanHistory = viewModel.scanHistoryAnalysisModel {
                            VStack {
                                ForEach(scanHistory, id: \.id) {
                                    history in
                                    NavigationLink(destination: ScanResultView(viewModel: ScanResultViewModel(scannedData: nil, analysisResult: history))) {
                                        HStack {
                                            Text("Scanned Product #\(history.id ?? 0)")
                                                .foregroundStyle(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.customDarkGrey)
                                        }
                                        .padding()
                                    }
                                    
                                }
                                
                            }
                            .background(.white)
                            .cornerRadius(10)
                        } else {
                            Text("No history")
                        }
                        
                    }
                    .onAppear() {
                        viewModel.fetchScanHistory()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    NavigationView {
        ForYouTabView()
    }
}
