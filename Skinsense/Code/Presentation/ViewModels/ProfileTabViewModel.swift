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
    
    func signOut() {
        CoreDataManager.shared.clearLoggedInUserData()
        self.updateState()
    }
    
    func updateState() {
        let userCoreData = self.fetchUserData()
        self.isSigned = userCoreData?.appleUserId != nil
        self.userData = userCoreData
    }
    
    func updateLocalUserData(newUserData: APIUser) -> User?{
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
        let savedPersonalization: User? = CoreDataManager.shared.fetchUserData().first
        switch result {
        case .success(let auth):
            switch auth.credential {
            case let credential as ASAuthorizationAppleIDCredential:
                let skinTypes : [PersonalizationData] = savedPersonalization?.skinTypes?.allObjects as? [PersonalizationData] ?? []
                let skinConcerns : [PersonalizationData] = savedPersonalization?.skinConcerns?.allObjects as? [PersonalizationData] ?? []
                let allergens : [PersonalizationData] = savedPersonalization?.allergens?.allObjects as? [PersonalizationData] ?? []
                
                let userData: APIUser = APIUser(
                    id: credential.user,
                    name: credential.fullName?.givenName,
                    email: credential.email,
                    skinTypes: skinTypes.map({$0.name ?? ""}).joined(separator: ","),
                    skinConcerns: skinConcerns.map({$0.name ?? ""}).joined(separator: ", "),
                    allergens: allergens.map({$0.name ?? ""}).joined(separator: ", ")
                )
                
                repository.auth(userData: userData) { result in
                    switch result {
                    case .success(let user):
                        self.updateLocalUserData(newUserData: user)
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
