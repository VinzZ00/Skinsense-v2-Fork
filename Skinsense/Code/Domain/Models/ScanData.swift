//
//  ScanData.swift
//  Skinsense
//
//  Created by Rainer Regan on 09/11/23.
//

import Foundation

struct ScanData: Identifiable, Hashable {
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
