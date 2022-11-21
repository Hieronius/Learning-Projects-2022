//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by Арсентий Халимовский on 21.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var userData = UserDefaults.standard
    
    var switchToggledOption = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchToggledOption = userData.bool(forKey: "switchStatement")
        let isOn = userData.bool(forKey: "switchIsOn")
        updateBackground(isOn: isOn)
    }


    @IBAction func switchToggled(_ sender: UISwitch) {
        updateBackground(isOn: sender.isOn)
        
        userData.setValue(sender.isOn, forKey: "switchIsOn")
        userData.setValue(switchToggledOption, forKey: "switchStatement")
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .orange : .darkGray
        switchToggledOption = isOn ? true : false
    }
}

