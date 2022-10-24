//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Tran Thanh on 10/17/22.
//

import Foundation

class RecipeModel:ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        //Create an instance of adata service and get the data
        self.recipes = DataService.getLocalData()
    }
    
}
