//
//  Menu.swift
//  MenuApp
//
//  Created by Waqar on 12/1/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import UIKit

class Menu:CustomStringConvertible {
    
    // MARK: Properties
    var dish_name: String
    var price: Int
    
    var description: String {
        return "Menu->\(self.dish_name)"
    }

    // MARK: Initialization
    init(dataDict: Dictionary<String, AnyObject>) {
        self.dish_name = dataDict["dish_name"] as! String
        self.price = dataDict["price"] as! Int
    }
}

