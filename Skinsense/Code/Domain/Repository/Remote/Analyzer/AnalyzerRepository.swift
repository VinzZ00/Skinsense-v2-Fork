//
//  AnalyzerRepository.swift
//  Skinsense
//
//  Created by Rainer Regan on 12/11/23.
//

import Foundation

class AnalyzerRepository {
    private let dataSource: AnalyzerDataSource = AnalyzerDataSource()

    func getAnalysis(request: AnalysisRequest, completion: @escaping (Result<AnalysisModel, Error>) -> Void) {
        dataSource.getAnalysis(request: request, completion: completion)
    }
}
