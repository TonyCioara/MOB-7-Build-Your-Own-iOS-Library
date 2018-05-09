//
//  FetchedItem.swift
//  bestBuyAppPractice
//
//  Created by Tony Cioara on 5/8/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

struct FetchedItem: Codable {
    
    let name: String
    let image: URL
    let sku: Int
    let salePrice: Double
    
}
