//
//  GameScene.swift
//  Project 17
//
//  Created by Арсентий Халимовский on 21.12.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var numberOfEnemies = 0
    
    var possibleEnemies = ["ball", "hammer", "tv"]
    var gameTimer: Timer?
    var isGameOver = false
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        starfield = SKEmitterNode(fileNamed: "starfield")!
        starfield.position = CGPoint(x: 1024, y: 384) // half of the normal Y-size
        starfield.advanceSimulationTime(10)
        addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 100, y: 384) // again only half of the y-size
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.contactTestBitMask = 1
        addChild(player)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        getTimer()
        
    }
    
    @objc func createEnemy() {
        
        
        if !isGameOver {
            guard let enemy = possibleEnemies.randomElement() else { return }
            
            let sprite = SKSpriteNode(imageNamed: enemy)
            sprite.position = CGPoint(x: 1200, y: Int.random(in: 50...736))
            addChild(sprite)
            
            sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
            sprite.physicsBody?.contactTestBitMask = 1
            sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
            sprite.physicsBody?.angularVelocity = 5
            sprite.physicsBody?.linearDamping = 0
            sprite.physicsBody?.angularDamping = 0
            
            numberOfEnemies += 1
            print(numberOfEnemies)
        }
        
    }
    
    func getTimer() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.createEnemy()
            print("normal speed")
            
            if self.numberOfEnemies >= 5 && self.numberOfEnemies < 10 {
                self.gameTimer!.invalidate()
                self.gameTimer = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true) { timer in
                    self.createEnemy()
                    print("fast speed")
                    
                    if self.numberOfEnemies >= 9 && self.numberOfEnemies < 20 {
                        self.gameTimer!.invalidate()
                        self.gameTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { timer in
                            self.createEnemy()
                            print("turboSpeed")
                            
                            if self.numberOfEnemies >= 19 && self.numberOfEnemies < 40 {
                                self.gameTimer!.invalidate()
                                self.gameTimer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { timer in
                                    self.createEnemy()
                                    print("Ultra speed")
                            }
                        }
                    }
                    
                }
            }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
        }
        if !isGameOver {
            score += 1
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        var location = touch.location(in: self)
        
        if location.y < 100 {
            location.y = 100
        } else if location.y > 668 {
            location.y = 668
        }
        
        player.position = location
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let explosion = SKEmitterNode(fileNamed: "explosion")!
        explosion.position = player.position
        addChild(explosion)
        
        player.removeFromParent()
        isGameOver = true
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        if player.position != location {
//            player.position = CGPoint(x: 100, y: 500)
//        }
//
//
//    }
}
