//
//  ImageNSObject.swift
//  Project 1
//
//  Created by Арсентий Халимовский on 28.10.2022.
//

import UIKit

class ImageNSObject: NSObject {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
