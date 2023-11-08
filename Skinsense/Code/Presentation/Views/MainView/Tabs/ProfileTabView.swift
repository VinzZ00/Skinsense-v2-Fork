//
//  ProfileTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI
import AuthenticationServices

struct ProfileTabView: View {
    @StateObject var viewModel: ProfileTabViewModel = ProfileTabViewModel()
    
    var body: some View {
        ScrollView {
            if(viewModel.isSigned) {
                SignedInView()
            } else {
                LoggedOutView()
            }
        }
        .background(Color.bgColor)
    }
}

struct SignedInView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Profile")
                .font(.largeTitle)
                .bold()
            
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
                    NavigationLink(destination: MainView()) {
                        HStack {
                            Text("My Skin Personalization")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                    NavigationLink(destination: MainView()) {
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
                    NavigationLink(destination: MainView()) {
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
    var body: some View {
        VStack {
            // Gallery
            HStack(spacing: 10) {
                // Left
                VStack(spacing: 10) {
                    Image("profile_1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fill)
                    Image("profile_4")
                        .resizable()
                        .frame(width: 200, height: 272)
                        .aspectRatio(contentMode: .fill)
                }
                
                // Right
                VStack(spacing: 10) {
                    Image("profile_2")
                        .resizable()
                        .frame(width: 200, height: 272)
                        .aspectRatio(contentMode: .fill)
                    Image("profile_3")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fill)
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
                        .foregroundStyle(Color.darkPurple)
                    
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
                .frame(width: 250, height: 50)
                .padding()
                .cornerRadius(14)
                
                Spacer()
                    .frame(height: 8)
                
                // Menu
                VStack {
                    NavigationLink(destination: MainView()) {
                        HStack {
                            Text("My Skin Personalization")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                    }
                    NavigationLink(destination: MainView()) {
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
            }
            .padding(24)
            
        }
    }
}

#Preview {
    ProfileTabView()
}
