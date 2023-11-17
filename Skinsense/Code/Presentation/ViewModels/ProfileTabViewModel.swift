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
    
    var repository : AuthRepository = AuthRepository()
    
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
                        print(user)
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
