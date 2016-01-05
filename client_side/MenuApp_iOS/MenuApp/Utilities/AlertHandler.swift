//
//  Utilities.swift
//  MenuApp
//
//  Created by Waqar on 12/17/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import Foundation
import SCLAlertView

func showAlert(title:String, subTitle:String) {
    SCLAlertView().showTitle(
        title,
        subTitle: subTitle,
        duration: 5.0,
        completeText: "Done",
        style: .Notice,
        colorStyle: 0xFF0000,
        colorTextButton: 0xFFFFFF
    )
}