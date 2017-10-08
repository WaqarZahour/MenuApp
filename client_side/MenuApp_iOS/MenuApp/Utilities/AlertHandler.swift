//
//  Utilities.swift
//  MenuApp
//
//  Created by Waqar on 12/17/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import Foundation
import SCLAlertView

class AlertHandler {
    
    /// This fucntion will show the alert in case of error occur of successfull completion
    ///
    /// - Parameters:
    ///   - title: This is alert title
    ///   - subTitle: This is the description
    static func showAlert(title:String, subTitle:String) {
        SCLAlertView().showTitle(
            title,
            subTitle: subTitle,
            duration: 5.0,
            completeText: "Done",
            style: .notice,
            colorStyle: 0xFF0000,
            colorTextButton: 0xFFFFFF)
    }
}
