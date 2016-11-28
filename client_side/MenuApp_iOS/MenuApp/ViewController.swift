//
//  ViewController.swift
//  MenuApp
//
//  Created by Waqar on 11/7/15.
//  Copyright © 2015 Waqar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // MARK: - Properties
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var shakeLabel:UILabel!
    @IBOutlet weak var pickerView:UIPickerView!


    var menuList:[Menu] = []
    var timer = Timer()
    var isShake = false
    var randomIndex = 0
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Menu"
        self.nameLabel.text = "Price"
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadData() {
        if Reachability.isConnectedToNetwork() == false {
            showAlert(title: INTERNET_NOT_AVAILABLE_TITLE, subTitle: INTERNET_NOT_AVAILABLE_SUB_TITLE)
            return
        }
        
        // Load the menu from service
        SVProgressHUD.show(withStatus: "Loading...")
        let service_manager:ServiceManager = ServiceManager.defaultManager
        service_manager.get_menu(URL) { list in
            if let list = list {
                print(list)
                self.menuList = list
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
            }
        }
    }
    
    // MARK: - Shake Handling
    /**
     This function tells that the motion event occur
    */
    override func motionEnded(_ motion: UIEventSubtype,
        with event: UIEvent?) {
            if motion == .motionShake{
                isShake = !isShake
                if isShake {
                    print("Shake")
                    self.shakeLabel.text = "'Shake your device to stop'"
                    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
                }
                else {
                    print("Stop Shake")
                    self.shakeLabel.text = "'Shake your device to start'"
                    timer.invalidate()
                }
            }
    }
    
    /**
     This function generate the random number and move the picker index
     */
    func update() {
        
        randomIndex = Int(arc4random_uniform(UInt32(self.menuList.count)))
        self.pickerView.selectRow(randomIndex, inComponent: 0, animated: false)
    }
    
    
    // MARK: - UIPicker view data source and delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.menuList.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let menu = self.menuList[row]
        self.nameLabel.text = "Price: \(menu.price)"
        return menu.dish_name
    }
    
    // MARK: - Button Actions
    @IBAction func reloadButtonPressed() {
        reloadData()
    }

}

