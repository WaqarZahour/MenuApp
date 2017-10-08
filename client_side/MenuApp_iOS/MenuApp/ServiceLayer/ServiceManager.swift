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
    
    var menuList = [Menu]()
    
    // MARK: Singleton Implementation
    static let defaultManager = ServiceManager()
    private init() {}
    
    /// In this function consume the restful services, parse the Menu model object
    ///
    /// - Parameters:
    ///   - url: that si defined in the constant
    ///   - completionHandler: when data fetch successfully update the picker view
    func get_menu(_ url:String, completionHandler:@escaping ResponseComplete) {
        Alamofire.request(url)
            .authenticate(user:USER_NAME, password:PASSWORD)
            .responseJSON {response in
                switch response.result {
                case .success(let result):
                    print(JSON(result))
                    if let menuList = result as? Array<Dictionary<String, AnyObject>> {
                        for menuDict in menuList {
                            if let itemList = menuDict[MENU.lowercased()] as? [Dictionary<String, AnyObject>] {
                                for menuJSON in itemList {
                                    let menu = Menu(JSON: menuJSON)
                                    self.menuList.append(menu!)
                                }
                            }
                        }
                    }
                    completionHandler(true)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    AlertHandler.showAlert(title: UNABLE_TO_CONNECT_TITLE, subTitle: UNABLE_TO_CONNECT_SUB_TITLE)
                    completionHandler(false)
                }
        }
    }
}
