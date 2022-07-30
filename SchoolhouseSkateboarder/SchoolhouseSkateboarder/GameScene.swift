//
//  GameScene.swift
//  SchoolhouseSkateboarder
//
//  Created by Арсентий Халимовский on 28.07.2022.
//

import SpriteKit
import GameplayKit


// This structure contains different physical categories and we can set
// which is will be contact or collide with each other

struct PhysicsCategory {
    
    static let skater: UInt32 = 0x1 << 0
    static let brick: UInt32 = 0x1 << 1
    static let gem: UInt32 = 0x1 << 2
    
}


class GameScene: SKScene {
    
    // array for all sections of sidewalk
    var bricks = [SKSpriteNode]()
    
    // size of the sections
    var brickSize = CGSize.zero
    
    // Settings for the bricks speed on our scene
    // This value can be increased in game
    var scrollSpeed: CGFloat = 5.0
    
    // Constant for gravitation
    let gravitySpeed: CGFloat = 1.5
    
    // Time of last call of update method
    var lastUpdateTime: TimeInterval?
    
    let skater = Skater(imageNamed: "skater")
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -6.0)
        
        anchorPoint = CGPoint.zero
        
        let background = SKSpriteNode(imageNamed: "background")
        let xMid = frame.midX
        let yMid = frame.midY
        background.position = CGPoint(x: xMid, y: yMid)
        addChild(background)
        
        // Creation of skater and adding her to the scene
        skater.setupPhysicsBody()
        
        // Set properties of skater sprite and adding it to the scene resetSkater()
        resetSkater()
        
        addChild(skater)
        
        // Adding click recognizer to find out when user clicks screen of the phone
        let tapMethod = #selector(GameScene.handleTap(tapGesture:))
        let tapGesture = UITapGestureRecognizer(target: self, action: tapMethod)
        view.addGestureRecognizer(tapGesture)
        
    
    }
    
    
    func resetSkater() {
        // Defining start position for skater, zPosition and minimumY
        let skaterX = frame.midX / 2.0
        let skaterY = skater.frame.height / 2.0 + 64.0
        skater.position = CGPoint(x: skaterX, y: skaterY)
        skater.zPosition = 10
        skater.minimumY = skaterY
    }
    
    func spawnBrick (atPosition position: CGPoint) -> SKSpriteNode {
        
        // Creating sprite of the break section of our sidewalk and adding him to the scene
        let brick = SKSpriteNode(imageNamed: "sidewalk")
        brick.position = position
        brick.zPosition = 8
        addChild(brick)
        
        // Updating property of brickSize with real value of section size
        brickSize = brick.size
        
        // Adding new section to the array of bricks
        bricks.append(brick)
        
        // Setting of physical body of the section
        let center = brick.centerRect.origin
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size, center: center)
        brick.physicsBody?.affectedByGravity = false
        
        brick.physicsBody?.categoryBitMask = PhysicsCategory.brick
        brick.physicsBody?.collisionBitMask = 0
        
        // Return of new section for calling code
        return brick
    }
    
    func updateBricks(withScrollAmount currentScrollAmount: CGFloat) {
        
        // Monitoring for biggest value of X axis for all current sections
        var farthestRightBrickX: CGFloat = 0.0
        
        for brick in bricks {
            
            let newX = brick.position.x - currentScrollAmount
            
            // If section shifted to much to the left (out from screen), delete it
            if newX < -brickSize.width {
                brick.removeFromParent()
                
                if let brickIndex = bricks.firstIndex(of: brick) {
                    bricks.remove(at: brickIndex)
                }
                
            } else {
                
                // for section which is staying on the screen, update position
                brick.position = CGPoint(x: newX, y: brick.position.y)
                
                // Updating value for far right section
                if brick.position.x > farthestRightBrickX {
                    farthestRightBrickX = brick.position.x
                }
            }
        }
            
            // cycle While, providing non stop filing the display with sections
            while farthestRightBrickX < frame.width {
                
                var brickX = farthestRightBrickX + brickSize.width + 1.0
                let brickY = brickSize.height / 2.0
                
                // Making some gaps in the sidewalk so our hero should jump over them
                let randomNumber = arc4random_uniform(99)
                
                if randomNumber < 5 {
                    
                    // 5 % chance to spawn gaps between the sections
                    let gap = 20.0 * scrollSpeed
                    brickX += gap
                }
                
                // Adding new section and updating position of farthest right
                let newBrick = spawnBrick(atPosition: CGPoint(x: brickX, y: brickY))
                farthestRightBrickX = newBrick.position.x
            
        }
    }
    
    func updateSkater() {
        
        if !skater.isOnGround {
            
            // Setting a new value of skater speed with regard to gravity
            let velocityY = skater.velocity.y - gravitySpeed
            skater.velocity = CGPoint(x: skater.velocity.x, y: velocityY)
            
            // Setting a new value for new position skater in Y axis in regard of her speed
            let newSkaterY: CGFloat = skater.position.y + skater.velocity.y
            skater.position = CGPoint(x: skater.position.x, y: newSkaterY)
            
            // Check if skater is already on the ground
            if skater.position.y < skater.minimumY {
                
                skater.position.y = skater.minimumY
                skater.velocity = CGPoint.zero
                skater.isOnGround = true
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // calling after drowing each shot
        
        // Count the time that left from last moment of call update method
        var elapsedTime: TimeInterval = 0.0
        if let lastTimeStamp = lastUpdateTime {
            elapsedTime = currentTime - lastTimeStamp
        }
        
        lastUpdateTime = currentTime
        
        let expectedElapsedTime: TimeInterval = 1.0 / 60.0
        
        // Calculating how far objects should move with current update
        let scrollAdjustment = CGFloat(elapsedTime / expectedElapsedTime)
        let currentScrollAmount = scrollSpeed * scrollAdjustment
        
        updateBricks(withScrollAmount: currentScrollAmount)
        
        updateSkater()
    }
    
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        
        // Skater jumps when user clicks on the screen when she is on the ground
        if skater.isOnGround {
            
            // Setting speed on Y axis for skater equal to her start speed of jump
            skater.velocity = CGPoint(x: 0.0, y: skater.jumpSpeed)
            
            // Note that skater already is not on the ground
            skater.isOnGround = false
        }
    }
}
