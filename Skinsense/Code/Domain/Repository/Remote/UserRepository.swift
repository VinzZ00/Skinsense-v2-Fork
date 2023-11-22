//
//  UserRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import Foundation

class UserRepository {
    private let dataSource: UserDataSource = UserDataSource()
    
    func getById(userId: String, completion: @escaping (Result<APIUser, Error>) -> Void) {
        dataSource.getById(userId: userId, completion: completion)
    }
    
    func delete(userId: String, completion: @escaping (Result<DeleteResponse, Error>) -> Void) {
        dataSource.delete(userId: userId, completion: completion)
    }
}
