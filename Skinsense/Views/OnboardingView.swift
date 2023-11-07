//
//  ContentView.swift
//  Skinsense
//
//  Created by Rainer Regan on 02/11/23.
//

import SwiftUI
import WrappingHStack

struct OnboardingView: View {
    @State var isSheetOpened = false
    
    var skinTypes : [SkinType] = [
        SkinType(id: UUID(), name: "Combination Skin"),
        SkinType(id: UUID(), name: "Dry Skin"),
        SkinType(id: UUID(), name: "Normal Skin"),
        SkinType(id: UUID(), name: "Sensitive Skin")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Title
            VStack(alignment: .leading) {
                Text("Tell Us About Your Skin")
                    .font(.system(size: 33, weight: .bold))
                Text("Share your skin type, concerns, and goals for personalized skincare recommendations!")
                    .font(.subheadline)
                    .foregroundStyle(Color.customDarkGrey)
            }
            
            Spacer()
                .frame(height: 25)
            
            VStack(alignment: .leading) {
                // Skin Type
                VStack(alignment: .leading) {
                    Text("Skin Type")
                        .font(.headline)
                    
                    // Bug fixed by Inez 7 Nov 2023 17:50:02
                    WrappingHStack(alignment:.leading) {
                        ForEach(skinTypes, id: \.id) {
                            skinType in
                            CustomCheckbox(name: skinType.name)
                        }
                    }
                    
                    Text("You may choose max two options")
                        .font(.subheadline)
                        .foregroundStyle(Color.customDarkGrey)
                }
                
                // Skin concerns
                
                // Your allergen
            }
        }
        .padding()
        .sheet(isPresented: $isSheetOpened, content: {
            OnboardingSheetView(isSheetOpened: $isSheetOpened)
                .padding(.top, 32)
        })
    }
}

struct OnboardingItems {
    var title: String
    var subtitle: String
    var icon: String
}

struct OnboardingSheetView: View {
    @Binding var isSheetOpened : Bool
    
    var items: [OnboardingItems] = [
        OnboardingItems(
            title: "Allergen Detection",
            subtitle: "We'll help you identify potential allergens in your skincare products.",
            icon: "leaf.fill"
        ),
        OnboardingItems(
            title: "Skincare Ingredient Analysis",
            subtitle: "Our app analyzes ingredients, offering insights into what you're applying.",
            icon: "staroflife.fill"
        ),
        OnboardingItems(
            title: "Personalized Recommendation",
            subtitle: "Discover products that are perfectly suited to your unique skin type and preferences.",
            icon: "heart.fill"
        )
    ]
    
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
                ForEach(items, id: \.title) {
                    item in
                    HStack(spacing: 15) {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.mediumPurple)
                        
                        VStack(alignment:.leading) {
                            Text("Allergen Detection")
                                .font(.headline)
                            Text("We'll help you identify potential allergens in your skincare products.")
                                .font(.subheadline)
                        }
                    }
                }
            }
            
            Spacer()
            
            // Block 3
            VStack {
                Image("onboarding_icon_bottom")
                Spacer()
                    .frame(height: 16)
                Text("When you're exploring SkinSense services, you'll find a world of skincare knowledge at your fingertips. Our app analyzes ingredients, offering insights into what you're applying to your skin, and provides personalized product recommendations tailored to your unique needs. Discover a smarter way to care for your skin with SkinSense.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
                .frame(height: 30)
            
            // Button
            CustomButton(title: "Get Started", action: {
                isSheetOpened = false
            })
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}