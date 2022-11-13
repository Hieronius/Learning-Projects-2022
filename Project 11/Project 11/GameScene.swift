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
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let ball = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
    
    func makeBouncer(at position: CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
    
    func makeSlot(at position: CGPoint, isGood: Bool) {
        var sloteBase: SKSpriteNode
        var sloteGlow: SKSpriteNode
        
        if isGood {
            sloteBase = SKSpriteNode(imageNamed: "slotBaseGood")
            sloteGlow = SKSpriteNode(imageNamed: "slotGlowGood")
        } else {
            sloteBase = SKSpriteNode(imageNamed: "slotBaseBad")
            sloteGlow = SKSpriteNode(imageNamed: "slotGlowBad")
        }
        
        sloteBase.position = position
        sloteGlow.position = position
        
        sloteBase.physicsBody = SKPhysicsBody(rectangleOf: sloteBase.size)
        sloteBase.physicsBody?.isDynamic = false
        
        
        addChild(sloteBase)
        addChild(sloteGlow)
        
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        sloteGlow.run(spinForever)
    }
}
