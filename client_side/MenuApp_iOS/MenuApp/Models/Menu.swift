//
//  Menu.swift
//  MenuApp
//
//  Created by Waqar on 12/1/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import UIKit
import ObjectMapper

class Menu: Mappable, CustomStringConvertible {
    
    // MARK: Properties
    var dish_name: String?
    var price: Int?
    
    var description: String {
        return "Menu->\(self.dish_name!)"
    }

    // MARK: Initialization
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        dish_name   <- map["dish_name"]
        price       <- map["price"]
    }
}

