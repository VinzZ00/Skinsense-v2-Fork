//
//  AccountDeletionRequestView.swift
//  Skinsense
//
//  Created by Rainer Regan on 22/11/23.
//

import SwiftUI

struct AccountDeletionRequestView: View {
    @State var confirmationText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var profileTabViewModel: ProfileTabViewModel
    var userRepository: UserRepository = UserRepository()
    
    func deleteUser() {
        if let userData = CoreDataManager.shared.fetchUserData().first, let userId = userData.appleUserId {
            userRepository.delete(userId: userId) { result in
                switch result {
                case .success(let success):
                    print("Success deleting user data: \(success)")
                    profileTabViewModel.signOut()
                    self.presentationMode.wrappedValue.dismiss()
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Are you sure want to delete your account?")
                    .bold()
                Text("You will lose these features once your account is successfully deleted:")
            
                VStack(alignment: .leading) {
                    Text("- Ability to add review to a product")
                    Text("- Your reviews will be deleted.")
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    Text("Type confirmation text to proceed")
                    TextField("Type: 'I am sure'", text: $confirmationText)
                        .padding()
                }
                
                CustomButton(title: "Delete Account", action:  {
                    // Delete account
                    self.deleteUser()
                }, isDisabled: self.confirmationText != "I am sure")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle("Account Deletion")
    }
    
}

//#Preview {
//    NavigationView {
//        AccountDeletionRequestView()
//    }
//}
