//
//  ContentView.swift
//  Skinsense
//
//  Created by Rainer Regan on 02/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Block 1
            Text("Welcome to SkinSense")
                .font(.largeTitle)
                .bold()
            
            Spacer()
                .frame(height: 40)
            
            // Block 2
            VStack(spacing: 25) {
                HStack(spacing: 15) {
                    Image("onboarding_icon_bottom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        
                    VStack(alignment:.leading) {
                        Text("Allergen Detection")
                            .font(.headline)
                        Text("We'll help you identify potential allergens in your skincare products.")
                            .font(.subheadline)
                    }
                }
                HStack(spacing: 15) {
                    Image("onboarding_icon_bottom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    VStack(alignment:.leading) {
                        Text("Allergen Detection")
                            .font(.headline)
                        Text("We'll help you identify potential allergens in your skincare products.")
                            .font(.subheadline)
                    }
                }
                HStack(spacing: 15) {
                    Image("onboarding_icon_bottom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    VStack(alignment:.leading) {
                        Text("Allergen Detection")
                            .font(.headline)
                        Text("We'll help you identify potential allergens in your skincare products.")
                            .font(.subheadline)
                    }
                }
            }
            
            Spacer()
            
            // Block 3
            VStack {
                Image("onboarding_icon_bottom")
                Text("When you're exploring SkinSense services, you'll find a world of skincare knowledge at your fingertips. Our app analyzes ingredients, offering insights into what you're applying to your skin, and provides personalized product recommendations tailored to your unique needs. Discover a smarter way to care for your skin with SkinSense.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
                .frame(height: 30)
            
            // Button
            Button {
                // Nanti ngapainnya disini
            } label: {
                Text("Get Started")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
