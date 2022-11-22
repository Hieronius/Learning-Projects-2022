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
            case signedInUser
        }
    
    var switchIsOn: Bool {
        get {
            bool(forKey: UserDefaultKeys.switchIsOn.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultKeys.switchIsOn.rawValue)
        }
    }
    
    var signedInUser: User? {
        get {
            if let data = object(forKey: UserDefaultKeys.signedInUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
        }
        
        set {
            
        }
    }
}
