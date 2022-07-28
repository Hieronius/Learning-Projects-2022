//
//  GameScene.swift
//  SchoolhouseSkateboarder
//
//  Created by Арсентий Халимовский on 28.07.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // array for all sections of sidewalk
    var bricks = [SKSpriteNode]()
    
    // size of the sections
    var brickSize = CGSize.zero
    
    // Settings for the bricks speed on our scene
    // This value can be increased in game
    var scrollSpeed: CGFloat = 5.0
    
    let skater = Skater(imageNamed: "skater")
    
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint.zero
        
        let background = SKSpriteNode(imageNamed: "background")
        let xMid = frame.midX
        let yMid = frame.midY
        background.position = CGPoint(x: xMid, y: yMid)
        addChild(background)
        
        // Set properties of skater sprite and adding it to the scene resetSkater()
        resetSkater()
        addChild(skater)
    }
    
    func resetSkater() {
        // Defining start position for skater, zPosition and minimumY
        let skaterX = frame.midX / 2.0
        let skaterY = skater.frame.height / 2.0 + 64.0
        skater.position = CGPoint(x: skaterX, y: skaterY)
        skater.zPosition = 10
        skater.minimumY = skaterY
    }
    
    override func update(_ currentTime: TimeInterval) {
        // calling after drowing each shot
    }
}
