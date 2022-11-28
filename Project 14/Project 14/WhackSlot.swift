//
//  WhackSlot.swift
//  Project 14
//
//  Created by Арсентий Халимовский on 28.11.2022.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
    
    var charNode: SKSpriteNode!

    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = nil
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
}
