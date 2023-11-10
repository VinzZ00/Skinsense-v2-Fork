//
//  CheckListItem.swift
//  Skinsense
//
//  Created by Rainer Regan on 10/11/23.
//

import SwiftUI

struct CheckListItem: View {
    var isTrue = true
    var text: String
    
    var body: some View {
        HStack{
            Image(systemName: isTrue ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(isTrue ? .customGreen : .red)
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CheckListItem(isTrue: false, text: "Text")
}
