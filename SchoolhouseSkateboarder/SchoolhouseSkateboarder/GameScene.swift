//
//  GameScene.swift
//  SchoolhouseSkateboarder
//
//  Created by Арсентий Халимовский on 28.07.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint.zero
        
        let background = SKSpriteNode(imageNamed: "background")
        let xMid = frame.midX
        let yMid = frame.midY
        background.position = CGPoint(x: xMid, y: yMid)
        addChild(background)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // calling after drowing each shot
    }
}
