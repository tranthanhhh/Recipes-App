//
//  DataService.swift
//  Recipe List App
//
//  Created by Tran Thanh on 10/17/22.
//

import Foundation

class DataService {
    
   static func getLocalData() -> [Recipe] {
        //Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //Check if pathString is not nil, otherwise..
        guard pathString != nil else {
            return [Recipe]()
        }
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //CREATE a data object
            let data = try Data(contentsOf: url)
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    //Add unique IDs to recipe ingredients 
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            //error with getting data
            print(error)
        }
        //Return the recipes
        return [Recipe]()
    }
}
