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
                            PersonalizedProductIcon(category: "Cleanser", icon: "FacialFoam")
                            PersonalizedProductIcon(category: "Toner", icon: "Toner")
                            PersonalizedProductIcon(category: "Serum", icon: "Serum")
                            PersonalizedProductIcon(category: "Moisturizer", icon: "Moisturizer")
                            PersonalizedProductIcon(category: "Exfoliator", icon: "Exfo")
                            PersonalizedProductIcon(category: "Sun Screen", icon: "Sunscreen")
                            PersonalizedProductIcon(category: "Face Mask", icon: "faceMask")
                            PersonalizedProductIcon(category: "Others", icon: "Others")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recently Scanned")
                            .font(.title3)
                            .bold()
                        
                        VStack {
                            // TODO: Integrate from inez-buset
                            NavigationLink(destination: MainView()) {
                                HStack {
                                    Text("Scanned Product #1")
                                        .foregroundStyle(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.customDarkGrey)
                                }
                                .padding()
                            }
                            .disabled(true)
                        }
                        .background(.white)
                        .cornerRadius(10)
                        
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
