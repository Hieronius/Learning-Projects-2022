//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by Арсентий Халимовский on 21.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var userData = UserDefaults.standard
    
    @IBOutlet var switchView: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let isOn = userData.bool(forKey: "switchIsOn")
        updateBackground(isOn: isOn)
    }


    @IBAction func switchToggled(_ sender: UISwitch) {
        updateBackground(isOn: sender.isOn)
        
        userData.setValue(sender.isOn, forKey: "switchIsOn")
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .orange : .darkGray
        switchView.isOn = isOn
    }
}

