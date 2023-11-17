//
//  ProfileTabViewModel.swift
//  Skinsense
//
//  Created by Rainer Regan on 08/11/23.
//

import Foundation
import AuthenticationServices

class ProfileTabViewModel: ObservableObject {
    @Published var isSigned : Bool = false
    @Published var userData : User?
    
    var repository : AuthRepository = AuthRepository()
    
    func fetchUserData() -> User? {
        let userCoreData = CoreDataManager.shared.fetchUserData().first
        return userCoreData
    }
    
    func updateState() {
        let userCoreData = self.fetchUserData()
        self.isSigned = userCoreData?.appleUserId != nil
        self.userData = userCoreData
    }
    
    func updateUserData(newUserData: APIUser) -> User?{
        let userCoreData = self.fetchUserData()
        
        if(userCoreData == nil) { return nil }
        
        userCoreData?.email = newUserData.email
        userCoreData?.name = newUserData.name
        userCoreData?.appleUserId = newUserData.id
        
        do {
            try CoreDataManager.shared.viewContext.save()
            return userCoreData
        } catch {
            print(error)
            return nil
        }
    }
    
    func handleAppleSignIn(result: Result<ASAuthorization, any Error>) {
        switch result {
        case .success(let auth):
            switch auth.credential {
            case let credential as ASAuthorizationAppleIDCredential:
                let email = credential.email
                let firstName = credential.fullName?.givenName
                let lastName = credential.fullName?.familyName
                let userId = credential.user
                let userData = APIUser(id: userId, name: firstName, email: email)
                
                repository.auth(userData: userData) { result in
                    switch result {
                    case .success(let user):
                        let userData = self.updateUserData(newUserData: user)
                        self.updateState()
                    case .failure(let error):
                        print(error)
                    }
                }
            default:
                break
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
