//
//  AuthRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 17/11/23.
//

import Foundation

class AuthRepository {
    private let dataSource: AuthDataSource = AuthDataSource()
    
    func auth(userData: APIUser, completion: @escaping (Result<APIUser, Error>) -> Void) {
        dataSource.auth(userData: userData, completion: completion)
    }
}
