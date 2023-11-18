//
//  ProfileTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI
import AuthenticationServices
import Kingfisher

struct ProfileTabView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: ProfileTabViewModel = ProfileTabViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if(viewModel.isSigned) {
                    SignedInView(viewModel: viewModel)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
                } else {
                    LoggedOutView(viewModel: viewModel)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
                }
            }
            .onAppear {
                viewModel.updateState()
            }
            .navigationTitle("Profile")
            .toolbar(viewModel.isSigned ? .visible : .hidden)
            .sheet(isPresented: $viewModel.showBottomSheet, content: {
                switch viewModel.activeSheet {
                case .skinPersonalization:
                    SkinPersonalizationSheetView(viewModel: viewModel)
                case .savedProducts:
                    Text("Saved Products")
                }
            })
        }
    }
}

struct SignedInView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: ProfileTabViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                
                if let userData = viewModel.userData {
                    VStack {
                        KFImage(URL(string: "https://gravatar.com/avatar/\(userData.appleUserId)?d=identicon"))
                            .resizable()
                            .frame(width: 106, height: 106)
                            .clipShape(Circle())
                            .foregroundColor(.green)
                        
                        Text(userData.name ?? "User Name")
                            .font(.title2)
                            .bold()
                        
                        Text((userData.email ?? userData.appleUserId) ?? "Email")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
                    .frame(height: 25)
                
                // Menu
                ProfileMenuView(viewModel: viewModel)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct LoggedOutView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel : ProfileTabViewModel
    
    var body: some View {
        VStack {
            // Gallery
            HStack(spacing: 10) {
                // Left
                VStack(spacing: 10) {
                    Image("profile_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 170, alignment: .center)
                        .clipped()
                    Image("profile_4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 200, alignment: .center)
                        .clipped()
                }
                
                // Right
                VStack(spacing: 10) {
                    Image("profile_2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 200, alignment: .center)
                        .clipped()
                    Image("profile_3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 170, alignment: .center)
                        .clipped()
                }
            }
            .padding(10)
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
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    print(result)
                    viewModel.handleAppleSignIn(result: result)
                }
                .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
                .frame(width: 250, height: 50)
                .padding()
                .cornerRadius(14)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding(24)
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
                    startPoint: .top, endPoint: .bottom)
            )
            
            // Menu
            ProfileMenuView(viewModel: viewModel)
                .padding()
        }
    }
}

struct ProfileMenuView : View {
    @ObservedObject var viewModel: ProfileTabViewModel
    
    var body: some View {
        
        // Menu
        VStack {
            VStack {
                Button {
                    viewModel.activeSheet = .skinPersonalization
                    viewModel.showBottomSheet.toggle()
                } label: {
                    HStack {
                        Text("My Skin Personalization")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                }
                
                Button {
                    viewModel.activeSheet = .savedProducts
                    viewModel.showBottomSheet.toggle()
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
            
            if viewModel.isSigned {
                Spacer()
                    .frame(height: 25)
                
                // Sign Out
                VStack {
                    Button {
                        viewModel.signOut()
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
    }
}

struct SkinPersonalizationSheetView: View {
    var personalizationViewModel: PersonalizationViewModel = PersonalizationViewModel(isSheetOpened: false)
    @ObservedObject var viewModel: ProfileTabViewModel
    
    var body: some View {
        NavigationView {
            PersonalizationView(callback: { user in print(user) }, showButton: false, viewModel: personalizationViewModel)
                .navigationTitle("My Skin Personalization")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            personalizationViewModel.handleUpdate { user in
                                print(user)
                                if user != nil {
                                    viewModel.showBottomSheet.toggle()
                                }
                            }
                        } label: {
                            Text("Done")
                        }
                    }
                })
        }
    }
}

#Preview {
    NavigationView {
        ProfileTabView()
    }
}
