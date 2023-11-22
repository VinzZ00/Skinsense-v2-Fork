//
//  UserDataSource.swift
//  Skinsense
//
//  Created by Rainer Regan on 21/11/23.
//

import Foundation
import Alamofire

class UserDataSource {
    let APIBASEURL = ConfigurationManager.shared.apiBaseUrl() + "user"
    
    func getById(userId: String, completion: @escaping (Result<APIUser, Error>) -> Void) {
        AF.request("\(APIBASEURL)/\(userId)", method: .get, encoding:URLEncoding(destination: .queryString)).responseDecodable(of: APIUser.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func delete(userId: String, completion: @escaping (Result<DeleteResponse, Error>) -> Void) {
        AF.request("\(APIBASEURL)/\(userId)", method: .delete, encoding: JSONEncoding.default).responseDecodable(of: DeleteResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
