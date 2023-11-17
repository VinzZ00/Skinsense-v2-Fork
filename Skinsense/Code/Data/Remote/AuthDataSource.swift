//
//  AuthDataSource.swift
//  Skinsense
//
//  Created by Rainer Regan on 17/11/23.
//

import Foundation
import Alamofire

class AuthDataSource {
    let APIBASEURL = ConfigurationManager.shared.apiBaseUrl() + "auth"
    
    func auth(userData: APIUser, completion: @escaping (Result<APIUser, Error>) -> Void) {
        
        // Define parameters (if any)
        let parameters: [String: Any] = [
            "id": userData.id,
            "name": userData.name,
            "email": userData.email
        ]
        
        AF.request(APIBASEURL, method: .post, parameters: parameters, encoding:JSONEncoding.default).responseDecodable(of: APIUser.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
