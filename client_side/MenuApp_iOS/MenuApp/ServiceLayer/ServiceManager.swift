//
//  MenuService.swift
//  MenuApp
//
//  Created by Waqar on 12/17/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceManager {
    
    static let defaultManager = ServiceManager()
    private init() {}
    
    
     /**
     In this function consume the restful services, parse the Menu model object
     - Parameter url: "http://192.168.1.4:5000/api/v1.0/menu/"
     - Returns: List of Menu Object
     */
    func get_menu(url:String, completionHandler:(list: [Menu]?)->()) {
        
        Alamofire.request(.GET, url)
            .authenticate(user:USER_NAME, password:PASSWORD)
            .responseJSON {response in
                
                print("Response String: \(response.result.value)")
                
                switch response.result {
                case .Success(let data):
                    print(data)
                    print(JSON(data))
                    var tempList:[Menu] = []
                    for var i = 0; i<data.count; ++i {
                        let dictResult = data.objectAtIndex(i) as! NSDictionary
                        let group_name = dictResult.valueForKey("tag_name") as! String
                        print(group_name)
                        
                        let arr = dictResult.valueForKey("menu") as! NSArray
                        for var j = 0; j<arr.count; ++j {
                            
                            let dictFormats = arr.objectAtIndex(j) as! NSDictionary
                            let name = dictFormats.valueForKey("dish_name") as! String
                            let price = dictFormats.valueForKey("price") as! Int
                            let menu = Menu(dish_name: name, price: price)
                            tempList.append(menu)
                            
                            
                            print(menu)
                        }
                    }
                    completionHandler(list: tempList)
                    SVProgressHUD.dismiss()
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                    SVProgressHUD.dismiss()
                    showAlert(UNABLE_TO_CONNECT_TITLE, subTitle: UNABLE_TO_CONNECT_SUB_TITLE)
                }
        }
        
    }
}
