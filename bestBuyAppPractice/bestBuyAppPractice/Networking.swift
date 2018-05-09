//
//  Networking.swift
//  bestBuyAppPractice
//
//  Created by Tony Cioara on 5/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Networking {
    
    func fetchResults(searchTerm: String, callBack: @escaping (Array<FetchedItem>) -> ()) {
        
        //https://api.bestbuy.com/v1/products((search=Headphones)&(categoryPath.id=abcat0204000))?apiKey=LPnigjgodZFVX0TvAIlZ3sKk&format=json
        
        let apiKey = "apiKey=LPnigjgodZFVX0TvAIlZ3sKk"
        let baseUrl = "https://api.bestbuy.com/v1/products"
        let searchComponent = "((search=\(searchTerm)))"
        
        let fullUrl = baseUrl + searchComponent + "?" + apiKey + "&format=json"
        let request = URLRequest(url: URL(string: fullUrl)!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            Check the response and error
            if error != nil {print("ERROR"); return}
            
//            Use swiftyjson to get the array of products
            guard
                let fetchResults = data,
                let jsonData = try? JSON(data: fetchResults),
                let productsData = try? jsonData["products"].rawData(),
                let fetchedItems = try? JSONDecoder().decode(Array<FetchedItem>.self, from: productsData)
                else {print("JSON ERROR"); return}
            
            callBack(fetchedItems)
        } .resume()
    }
    
    
}
