//
//  ProductResultView.swift
//  Skinsense
//
//  Created by Shelamines Julianni on 08/11/23.
//

import SwiftUI

struct ProductResultView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.customdarkBlue)
                    Text("This suggestion is based on EWG certified database. We do not guarantee results, consult with your doctor prior to using any product.")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .buttonStyle(.plain)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(Color.lightBlue.opacity(0.1))
                .cornerRadius(10)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                )
                
                //gambar product
                ZStack(alignment:.bottomTrailing){
                    Image("skincare_product1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 252, height: 260)
                    Image("Stamp_Recommended")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .padding(.trailing, 40)
                }
                
                //nama product
                VStack(alignment: .leading){
                    HStack(spacing: 20){
                        Text("Acne Spot Cream The Originote")
                            .font(.title2)
                            .bold()
                            .fixedSize(horizontal: true, vertical: true)
                        Image (systemName: "bookmark")
                            .resizable()
                            .foregroundColor(.darkPurple)
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                    }
                    Text("Face Cleanser")
                        .font(.body)
                        .foregroundColor(.customDarkGrey)
                    Spacer()
                        .frame(height: 15)
                }
                //tingkat ke-efektifan
                VStack{
                    Text("Based on your personalization, the product's effectiveness level is 70.3%")
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .background(Color.customGreen.opacity(0.2))
                        .cornerRadius(10)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.customGreen, lineWidth: 1)
                        )
                }
                Spacer()
                    .frame(height: 15)
                
                //point-point
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.customGreen)
                        Text("Effective for your Sensitive Skin")
                    }
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.customGreen)
                        Text("Good for Redness, Acne, and Dark Spots")
                    }
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.customGreen)
                        Text("Effective for your Sensitive Skin")
                    }
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.customGreen)
                        Text("Contain active ingredients such as Benzoyl Peroxide")
                    }
                    HStack{
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                        Text("Contain active ingredients such as Benzoyl Peroxide")
                    }
                }
                Spacer()
                    .frame(height: 30)
                
                //How to use
                VStack(alignment:.leading, spacing: 10){
                    Text("How To Use")
                        .font(.title3)
                        .bold()
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Incompatible with")
                            .font(.body)
                            .bold()
                            .lineSpacing(15)
                        Text("Products that contain Retinoid and Vitamin A")
                            .font(.subheadline)
                            .foregroundColor(.customDarkGrey)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Effective with")
                            .font(.body)
                            .bold()
                            .lineSpacing(15)
                        Text("Products that contain Hyaluronic Acid, Niacinamide, and Glycerin")
                            .font(.subheadline)
                            .foregroundColor(.customDarkGrey)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Additional Information")
                            .font(.body)
                            .bold()
                            .lineSpacing(15)
                        Text("Those with sensitive skin can use products that contain Benzoyl Peroxide with a concentration of lower than 4%")
                            .font(.subheadline)
                            .foregroundColor(.customDarkGrey)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(width: 358, height: 225)
            }
        }
    }
}


#Preview {
    ProductResultView()
}
