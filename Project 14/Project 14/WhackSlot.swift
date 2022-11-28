//
//  WhackSlot.swift
//  Project 14
//
//  Created by Арсентий Халимовский on 28.11.2022.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {

    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}
