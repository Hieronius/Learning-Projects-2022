//
//  GameScene.swift
//  Project 11
//
//  Created by Арсентий Халимовский on 11.11.2022.
//

import SpriteKit


class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        addChild(background)
    }
}
