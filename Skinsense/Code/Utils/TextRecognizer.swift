//
//  TextRecognizer.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import Foundation
import VisionKit
import Vision

final class TextRecognizer {
    let cameraScan: VNDocumentCameraScan
    
    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }
    
    private let queue = DispatchQueue(label: "scan-text", qos: .default, attributes: [], autoreleaseFrequency: .workItem)
    
    func recognizeText(withCompletionHandler completionHandler: @escaping ([String]) -> Void) {
        queue.async {
            // TODO: ROADMAP
            /// Untuk next, bisa melakukan multiple product scanning dengan modify code disini
            /// Disini kita bisa mendapatkan beberapa page yang sudah di foto oleh user
            /// // Process the scanned pages
            /// for pageNumber in 0..<scan.pageCount {
            ///     let image = scan.imageOfPage(at: pageNumber)
            /// }

            let images = (0..<self.cameraScan.pageCount).compactMap {
                self.cameraScan.imageOfPage(at: $0).cgImage
            }
            let imagesAndRequests = images.map({(image: $0, request: VNRecognizeTextRequest())})
            let textPerPage = imagesAndRequests.map { image,request -> String  in
                let handler = VNImageRequestHandler(cgImage: image, options: [:])
                do {
                    try handler.perform([request])
                    guard let observations = request.results as? [VNRecognizedTextObservation] else {return ""}
                    
                    return observations.compactMap({
                        $0.topCandidates(1).first?.string
                    }).joined(separator: "\n")
                }
                catch {
                    print(error)
                    return ""
                }
            }
            
            DispatchQueue.main.async {
                completionHandler(textPerPage)
            }
        }
    }
}
