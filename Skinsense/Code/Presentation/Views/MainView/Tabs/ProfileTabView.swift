//
//  ProfileTabView.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import SwiftUI
import AuthenticationServices

struct ProfileTabView: View {
    var body: some View {
        ScrollView {
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
                }
                .padding(24)
                
            }
        }
        .background(Color.bgColor)
    }
}

#Preview {
    ProfileTabView()
}
