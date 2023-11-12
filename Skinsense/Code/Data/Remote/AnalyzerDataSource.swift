//
//  AnalyzerDataSource.swift
//  Skinsense
//
//  Created by Rainer Regan on 12/11/23.
//

import Foundation
import Alamofire

class AnalyzerDataSource {
    func getAnalysis(request: AnalysisRequest ,completion: @escaping (Result<AnalysisModel, Error>) -> Void) {
        let APIBASEURL = ConfigurationManager.shared.apiBaseUrl() + "analyzer"
        
        // Define parameters (if any)
        let parameters: [String: Any] = [
            "ingredients": request.ingredients,
            "concerns": request.concerns,
            "skinTypes": request.skinTypes
        ]
        
        AF.request(APIBASEURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: AnalysisModel.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
