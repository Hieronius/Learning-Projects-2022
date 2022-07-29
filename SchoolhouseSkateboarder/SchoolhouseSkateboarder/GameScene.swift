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
    
    // Time of last call of update method
    var lastUpdateTime: TimeInterval?
    
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
    
    func spawnBrick (atPosition position: CGPoint) -> SKSpriteNode {
        
        // Creating sprite of the break section of our sidewalk and adding him to the scene
        let brick = SKSpriteNode(imageNamed: "sidewalk")
        brick.position = position
        brick.zPosition = 8
        
        // Updating property of brickSize with real value of section size
        brickSize = brick.size
        
        // Adding new section to the array of bricks
        bricks.append(brick)
        
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
                
                if let brickIndex = bricks.index(of: brick) {
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
    }
    
    override func update(_ currentTime: TimeInterval) {
        // calling after drowing each shot
        
        // Count the time that left from last moment of call update method
        var elapsedTime: TimeInterval = 0.0
        if let lastTimeStamp = lastUpdateTime {
            elapsedTime = currentTime - lastTimeStamp
        }
        
        lastUpdateTime = currentTime
    }
}
