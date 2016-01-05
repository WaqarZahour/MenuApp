//
//  Menu.swift
//  MenuApp
//
//  Created by Waqar on 12/1/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import UIKit

class Menu: NSObject {
    
    // MARK: Properties
    var dish_name: String
    var price: Int
    override var description: String {
        return "Menu->\(self.dish_name)"
    }

    // MARK: Initialization
    init(dish_name: String, price: Int) {
        self.dish_name = dish_name
        self.price = price
    }
    


}

