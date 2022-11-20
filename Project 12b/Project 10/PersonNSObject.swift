//
//  PersonNSObject.swift
//  Project 10
//
//  Created by Арсентий Халимовский on 25.10.2022.
//

import UIKit

class PersonNSObject: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
