//
//  ContentView.swift
//  Skinsense
//
//  Created by Rainer Regan on 02/11/23.
//

import SwiftUI
import WrappingHStack

struct PersonalizationView: View {
    @StateObject var viewModel: PersonalizationViewModel = PersonalizationViewModel()
    
    @State var selectedSkinTypes: [UUID] = []
    @State var selectedSkinConcerns: [UUID] = []
    @State var selectedAllergens: [UUID] = []
    
    var skinTypes : [SkinType] = [
        SkinType(id: UUID(), name: "Combination Skin"),
        SkinType(id: UUID(), name: "Dry Skin"),
        SkinType(id: UUID(), name: "Normal Skin"),
        SkinType(id: UUID(), name: "Sensitive Skin")
    ]
    var skinConcerns : [SkinConcern] = [
        SkinConcern(id: UUID(), name: "Acne"),
        SkinConcern(id: UUID(), name: "Anti-Aging"),
        SkinConcern(id: UUID(), name: "Eczema"),
        SkinConcern(id: UUID(), name: "Dark Sports"),
        SkinConcern(id: UUID(), name: "Fungal Acne"),
        SkinConcern(id: UUID(), name: "Reduces Irritations"),
        SkinConcern(id: UUID(), name: "Rocasea"),
        SkinConcern(id: UUID(), name: "Scar Healing"),
        SkinConcern(id: UUID(), name: "Texture"),
        SkinConcern(id: UUID(), name: "Large Pores"),
    ]
    var allergens : [Allergen] = [
        Allergen(id: UUID(), name: "Fragrance"),
        Allergen(id: UUID(), name: "Alcohol"),
        Allergen(id: UUID(), name: "Smooth"),
        Allergen(id: UUID(), name: "Latex"),
        Allergen(id: UUID(), name: "Preservatives"),
    ]
    
    func addSkinType(id: UUID) {
        if selectedSkinTypes.contains(id) {
            print("Removing skin type")
            let index = selectedSkinTypes.firstIndex(of: id)!
            selectedSkinTypes.remove(at: index)
            return
        }
        if selectedSkinTypes.count == 2 {
            print("Max skin types selected.")
        } else {
            print("Adding skin type")
            selectedSkinTypes.append(id)
        }
    }
    func addSkinConcern(id: UUID) {
        if selectedSkinConcerns.contains(id) {
            print("Removing skin concern")
            let index = selectedSkinConcerns.firstIndex(of: id)!
            selectedSkinConcerns.remove(at: index)
            }
            else {
            print("Adding skin concern")
            selectedSkinConcerns.append(id)
        }
    }
    func addAllergen(id: UUID) {
        if selectedAllergens.contains(id) {
            print("Removing Allergen")
            let index = selectedAllergens.firstIndex(of: id)!
            selectedAllergens.remove(at: index)
            }
            else {
            print("Adding skin type")
            selectedAllergens.append(id)
        }
    }

    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView {
                // Title
                VStack(alignment: .leading) {
                    Text("Tell Us About Your Skin")
                        .font(.system(size: 33, weight: .bold))
                    Text("Share your skin type, concerns, and goals for personalized skincare recommendations!").fixedSize(horizontal: false, vertical: true)
                        .font(.subheadline)
                        .foregroundStyle(Color.customDarkGrey)
                }
                
                Spacer()
                    .frame(height: 25)
                
                VStack(spacing: 25) {
                    
                    // Skin Type
                    VStack(alignment: .leading) {
                        Text("Skin Type")
                            .font(.headline)
                        
                        // Bug fixed by Inez 7 Nov 2023 17:50:02
                        WrappingHStack(alignment:.leading) {
                            ForEach(skinTypes, id: \.id) {
                                skinType in
                                CustomCheckbox(onPress:  self.addSkinType,
                                               id: skinType.id,
                                               name: skinType.name,
                                               isActive: selectedSkinTypes.contains(skinType.id)
                                )
                            }
                        }
                        
                        Text("You may choose max two options")
                    }
                    
                    // Skin Concerns
                    VStack(alignment: .leading) {
                        Text("Skin Type")
                            .font(.headline)
                        
                        // Bug fixed by Inez 7 Nov 2023 17:50:02
                        WrappingHStack(alignment:.leading) {
                            ForEach(skinConcerns, id: \.id) {
                                skinConcern in
                                CustomCheckbox(onPress: self.addSkinConcern,
                                               id: skinConcern.id,
                                               name: skinConcern.name,
                                               isActive: selectedSkinConcerns.contains(skinConcern.id)
                                )
                                
                            }
                        }
                        
                        Text("You may choose max two options")
                    }
                    
                    // Your allergen
                    VStack(alignment: .leading) {
                        Text("Your Allergen")
                            .font(.headline)
                        
                        // Bug fixed by Inez 7 Nov 2023 17:50:02
                        WrappingHStack(alignment:.leading) {
                            ForEach(allergens, id: \.id) {
                                allergen in
                                CustomCheckbox(onPress: self.addAllergen,
                                               id: allergen.id,
                                               name: allergen.name,
                                               isActive: selectedAllergens.contains(allergen.id))
                            }
                        }
                        
                        Text("You may choose more than one")
                            .font(.subheadline)
                            .foregroundStyle(Color.customDarkGrey)
                    }
                    
                }
                Spacer()
                    .frame(height: 25)
            }
            
            CustomButton(title: "Done", action: {}
            )
        }
        .padding()
        .sheet(isPresented: $viewModel.isSheetOpened, content: {
            PersonalizationSheetView(isSheetOpened: $viewModel.isSheetOpened)
                .padding(.top, 32)
        })
    }
}

struct PersonalizationSheetItems {
    var title: String
    var subtitle: String
    var icon: String
}

struct PersonalizationSheetView: View {
    @Binding var isSheetOpened : Bool
    
    var items: [PersonalizationSheetItems] = [
        PersonalizationSheetItems(
            title: "Allergen Detection",
            subtitle: "We'll help you identify potential allergens in your skincare products.",
            icon: "leaf.fill"
        ),
        PersonalizationSheetItems(
            title: "Skincare Ingredient Analysis",
            subtitle: "Our app analyzes ingredients, offering insights into what you're applying.",
            icon: "staroflife.fill"
        ),
        PersonalizationSheetItems(
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
    PersonalizationView()
}
