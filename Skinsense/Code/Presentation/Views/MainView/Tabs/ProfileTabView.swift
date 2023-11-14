//
//  ProfileTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI
import AuthenticationServices

struct ProfileTabView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: ProfileTabViewModel = ProfileTabViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if(viewModel.isSigned) {
                    SignedInView(viewModel: viewModel)
                } else {
                    LoggedOutView()
                }
//                Button {
//                    viewModel.isSigned = true
//                } label: {
//                    Text("Test Sign In")
//                }
//                Button {
//                    CoreDataManager.shared.clearPersonalizationData()
//                } label: {
//                    Text("Clear personalization data")
//                }
            }
            .navigationTitle("Profile")
            .toolbar(viewModel.isSigned ? .visible : .hidden)
        }
    }
}

struct SignedInView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: ProfileTabViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                
                VStack {
                    Image("profile_1")
                        .resizable()
                        .frame(width: 106, height: 106)
                        .clipShape(Circle())
                        .foregroundColor(.green)
                    
                    Text("Name")
                        .font(.title2)
                        .bold()
                    
                    Text("Email")
                        .font(.subheadline)
                }
                
                Spacer()
                    .frame(height: 25)
                
                // Menu
                VStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("My Skin Personalization")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                    Button {
                        
                    } label: {
                        HStack {
                            Text("My Saved Products")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
                    .frame(height: 25)
                
                // Sign Out
                VStack {
                    Button {
                        // TODO: Implement Sign out
                        viewModel.isSigned = false
                    } label: {
                        HStack {
                            Text("Sign Out")
                                .foregroundStyle(.red)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct LoggedOutView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Gallery
            HStack(spacing: 10) {
                // Left
                VStack(spacing: 10) {
                    Image("profile_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipped()
                    Image("profile_4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 272, alignment: .center)
                        .clipped()
                }
                
                // Right
                VStack(spacing: 10) {
                    Image("profile_2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 272, alignment: .center)
                        .clipped()
                    Image("profile_3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipped()
                }
            }
            .padding(.vertical, 10)
            .background(Color.lightPurple)
            .frame(maxWidth: .infinity)
            
            
            // Bottom Section
            VStack {
                VStack(spacing: 8) {
                    HStack {
                        Text("Skinsense")
                            .font(.headline)
                    }
                    
                    Text("Share Your Review")
                        .font(.title)
                        .bold()
                        .foregroundStyle(colorScheme == .light ? Color.darkPurple : Color.mediumPurple)
                    
                    Text("Share your skincare review to enhance our database")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 250)
                }
                
                Spacer()
                    .frame(height: 8)
                
                SignInWithAppleButton(.continue) {
                    request in
                    
                } onCompletion: { request in
                    
                }
                .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
                .frame(width: 250, height: 50)
                .padding()
                .cornerRadius(14)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding(24)
            .padding(.top, 50)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: colorScheme == .light ? [
                            Color.white.opacity(0),
                            Color.white,
                            Color.white,
                            Color.white,
                            Color.white
                        ] : [
                            Color.black.opacity(0),
                            Color.black.opacity(0.8),
                            Color.black,
                            Color.black,
                            Color.black
                        ]),
                startPoint: .top, endPoint: .bottom))
            .offset(y: 200)
            
        }
    }
}

#Preview {
    NavigationView {
        ProfileTabView()
    }
}
