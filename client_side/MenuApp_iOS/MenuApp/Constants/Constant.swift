//
//  Constant.swift
//  MenuApp
//
//  Created by Waqar on 12/17/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

// Local Server URL
let URL:String = "http://ipaddress:port/api/v1.0/menu/"

// Auth
let USER_NAME:String = "adam@test.com"
let PASSWORD:String = "test"

// Screen Labels
let MENU = "Menu"
let PRICE = "Price"
let SHAKE_START = "'Shake your device to start'"
let SHAKE_STOP = "'Shake your device to stop'"


// Error Messages
let INTERNET_NOT_AVAILABLE_TITLE:String = "No Internet Connection"
let INTERNET_NOT_AVAILABLE_SUB_TITLE:String = "Kindly make sure you are connected with the internet!"

let UNABLE_TO_CONNECT_TITLE:String = "Unable To Connect"
let UNABLE_TO_CONNECT_SUB_TITLE:String = "Kindly make sure service url or auth credentials are correct"

// Completion Handler
typealias ResponseComplete = (Bool) -> ()
