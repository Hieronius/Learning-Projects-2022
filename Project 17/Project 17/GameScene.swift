//
//  GameScene.swift
//  Project 17
//
//  Created by Арсентий Халимовский on 21.12.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        <#code#>
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
