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
    fileprivate init() {}
    
    
     /**
     In this function consume the restful services, parse the Menu model object
     - Parameter url: "http://192.168.1.4:5000/api/v1.0/menu/"
     - Returns: List of Menu Object
     */
    func get_menu(_ url:String, completionHandler:@escaping (_ list: [Menu]?)->()) {
        
        Alamofire.request(url)
            .authenticate(user:USER_NAME, password:PASSWORD)
            .responseJSON {response in
                
                print("Response String: \(response.result.value)")
                
                switch response.result {
                case .success(let result):
                    print(result)
                    print(JSON(result))
                    let data = result as! NSArray
                    var tempList:[Menu] = []
                    for i in 0..<data.count {
                        let dictResult = data.object(at: i) as! NSDictionary
                        let group_name = dictResult.value(forKey: "tag_name") as! String
                        print(group_name)
                        
                        let arr = dictResult.value(forKey: "menu") as! NSArray
                        for j in 0..<arr.count {
                            
                            let dictFormats = arr.object(at: j) as! NSDictionary
                            let name = dictFormats.value(forKey: "dish_name") as! String
                            let price = dictFormats.value(forKey: "price") as! Int
                            let menu = Menu(dish_name: name, price: price)
                            tempList.append(menu)
                            
                            
                            print(menu)
                        }
                    }
                    completionHandler(tempList)
                    SVProgressHUD.dismiss()
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    SVProgressHUD.dismiss()
                    showAlert(title: UNABLE_TO_CONNECT_TITLE, subTitle: UNABLE_TO_CONNECT_SUB_TITLE)
                }
        }
        
    }
}
