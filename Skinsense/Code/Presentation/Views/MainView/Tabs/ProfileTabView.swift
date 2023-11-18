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
                    
                    Text(viewModel.userData?.name ?? "User Name")
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
                        .frame(width: 200, height: 170, alignment: .center)
                        .clipped()
                    Image("profile_4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipped()
                }
                
                // Right
                VStack(spacing: 10) {
                    Image("profile_2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipped()
                    Image("profile_3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 170, alignment: .center)
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
        }
    }
}

//struct LoggedOutView: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            // Gallery
//            HStack(spacing: 10) {
//                // Left
//                VStack(spacing: 10) {
//                    Image("profile_1")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 200, alignment: .center)
//                        .clipped()
//                    Image("profile_4")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 272, alignment: .center)
//                        .clipped()
//                }
//
//                // Right
//                VStack(spacing: 10) {
//                    Image("profile_2")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 272, alignment: .center)
//                        .clipped()
//                    Image("profile_3")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 200, alignment: .center)
//                        .clipped()
//                }
//            }
//            .padding(.vertical, 10)
//            .background(Color.lightPurple)
//            .frame(maxWidth: .infinity)
//
//
//            // Bottom Section
//            VStack {
//                VStack(spacing: 8) {
//                    HStack {
//                        Text("Skinsense")
//                            .font(.headline)
//                    }
//
//                    Text("Share Your Review")
//                        .font(.title)
//                        .bold()
//                        .foregroundStyle(colorScheme == .light ? Color.darkPurple : Color.mediumPurple)
//
//                    Text("Share your skincare review to enhance our database")
//                        .font(.subheadline)
//                        .multilineTextAlignment(.center)
//                        .frame(maxWidth: 250)
//                }
//
//                Spacer()
//                    .frame(height: 8)
//
//                SignInWithAppleButton(.continue) {
//                    request in
//                    print(request)
//                } onCompletion: { request in
//                    print(request)
//                }
//                .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
//                .frame(width: 250, height: 50)
//                .padding()
//                .cornerRadius(14)
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//            .padding(24)
//            .padding(.top, 50)
//            .background(
//                LinearGradient(
//                    gradient: Gradient(
//                        colors: colorScheme == .light ? [
//                            Color.white.opacity(0),
//                            Color.white,
//                            Color.white,
//                            Color.white,
//                            Color.white
//                        ] : [
//                            Color.black.opacity(0),
//                            Color.black.opacity(0.8),
//                            Color.black,
//                            Color.black,
//                            Color.black
//                        ]),
//                    startPoint: .top, endPoint: .bottom)
//            )
//            .offset(y: 200) // TODO: Bug disini, efek: Membuat button sign in with Apple tidak bisa di click
//
//        }
//    }
//}

#Preview {
    NavigationView {
        ProfileTabView()
    }
}
