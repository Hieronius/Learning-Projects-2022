//
//  UserDefaults+Extensions.swift
//  UserDefaultsApp
//
//  Created by Арсентий Халимовский on 22.11.2022.
//

import Foundation

extension UserDefaults {
        private enum UserDefaultKeys: String {
            case switchIsOn
        }
    
    var switchIsOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaultKeys.switchIsOn.rawValue)
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultKeys.switchIsOn.rawValue)
        }
    }
}
