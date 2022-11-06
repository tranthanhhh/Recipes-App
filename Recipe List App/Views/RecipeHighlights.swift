//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Tran Thanh on 11/6/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights =  ""
    
    init(highlights:[String]) {
        //Loop throught the highlights and build the string
        for index in 0..<highlights.count {
            //If this is the last item, don't add a comma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
