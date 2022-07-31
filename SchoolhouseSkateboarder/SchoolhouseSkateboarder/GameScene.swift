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


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Enum for position of sections in Y axis
    // Sections on the ground is low and section in the upper platform is high
    enum BrickLevel: CGFloat {
        case low = 0.0
        case high = 100.0
    }
    
    // array for all sections of sidewalk
    var bricks = [SKSpriteNode]()
    
    // array for all active gems
    var gems = [SKSpriteNode]()
    
    // size of the sections
    var brickSize = CGSize.zero
    
    // Current level defines position on axis Y for new sections
    var brickLevel = BrickLevel.low
    
    // Settings for the bricks speed on our scene
    // This value can be increased in game
    var scrollSpeed: CGFloat = 5.0
    
    let startingScrollSpeed: CGFloat = 5.0
    
    // Constant for gravitation
    let gravitySpeed: CGFloat = 1.5
    
    // Properties for monitoring results
    var score: Int = 0
    var highScore: Int = 0
    var lastScoreUpdateTime: TimeInterval = 0.0
    
    // Time of last call of update method
    var lastUpdateTime: TimeInterval?
    
    let skater = Skater(imageNamed: "skater")
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -6.0)
        physicsWorld.contactDelegate = self
        
        anchorPoint = CGPoint.zero
        
        let background = SKSpriteNode(imageNamed: "background")
        let xMid = frame.midX
        let yMid = frame.midY
        background.position = CGPoint(x: xMid, y: yMid)
        addChild(background)
        
        setupLabels()
        
        // Creation of skater and adding her to the scene
        skater.setupPhysicsBody()
        
        addChild(skater)
        
        // Adding click recognizer to find out when user clicks screen of the phone
        let tapMethod = #selector(GameScene.handleTap(tapGesture:))
        let tapGesture = UITapGestureRecognizer(target: self, action: tapMethod)
        view.addGestureRecognizer(tapGesture)
        
        startGame()
        
    
    }
    
    
    func resetSkater() {
        // Defining start position for skater, zPosition and minimumY
        let skaterX = frame.midX / 2.0
        let skaterY = skater.frame.height / 2.0 + 64.0
        skater.position = CGPoint(x: skaterX, y: skaterY)
        skater.zPosition = 10
        skater.minimumY = skaterY
        
        skater.zRotation = 0.0
        skater.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        skater.physicsBody?.angularVelocity = 0.0
    }
    
    func setupLabels() {
        
        // Label with word "Score" in upper left angle of the screen
        
        let scoreTextLabel: SKLabelNode = SKLabelNode(text: "Score")
        scoreTextLabel.position = CGPoint(x: 14.0, y: frame.size.height - 20.0)
        scoreTextLabel.horizontalAlignmentMode = .left
        
        scoreTextLabel.fontName = "Courier-Bold"
        scoreTextLabel.fontSize = 14.0
        scoreTextLabel.zPosition = 20
        addChild(scoreTextLabel)
        
        // Label with current score of the user
        let scoreLabel: SKLabelNode = SKLabelNode(text: "0")
        scoreLabel.position = CGPoint(x: 14.0, y: frame.size.height - 40.0)
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.fontName = "Courier-Bold"
        scoreLabel.fontSize = 18.0
        scoreLabel.name = "scoreLabel"
        scoreLabel.zPosition = 20
        addChild(scoreLabel)
        
        // label "best result" in the upper right angle
        
        let highScoreTextLabel: SKLabelNode = SKLabelNode(text: "best result")
        highScoreTextLabel.position = CGPoint(x: frame.size.width - 14.0, y: frame.size.height - 20.0)
        highScoreTextLabel.fontName = "Courier-Bold"
        highScoreTextLabel.horizontalAlignmentMode = .right
        highScoreTextLabel.fontSize = 14.0
        highScoreTextLabel.zPosition = 20
        addChild(highScoreTextLabel)
        
        // label with maximum user score
        
        let highScoreLabel: SKLabelNode = SKLabelNode(text: "0")
        highScoreLabel.position = CGPoint(x: frame.size.width - 14.0, y: frame.size.height - 40.0)
        highScoreLabel.horizontalAlignmentMode = .right
        highScoreLabel.fontName = "Courier-Bold"
        highScoreLabel.fontSize = 18.0
        highScoreLabel.name = "highScoreLabel"
        highScoreLabel.zPosition = 20
        addChild(highScoreLabel)
    }
    
    func updateScoreLabelText() {
        
        if let scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode {
            scoreLabel.text = String(format: "%04d", score)
        }
    }
    
    func updateHighScoreLabelText() {
        
        if let highScoreLabel = childNode(withName: "highScoreLabel") as? SKLabelNode {
            highScoreLabel.text = String(format: "%04d", highScore)
        }
    }
    
    func startGame() {
        
        // Return to the start condition when you run a new game
        resetSkater()
        
        score = 0
        
        scrollSpeed = startingScrollSpeed
        brickLevel = .low
        lastUpdateTime = nil
        
        for brick in bricks {
            brick.removeFromParent()
        }
        
        bricks.removeAll(keepingCapacity: true)
        
        for gem in gems {
            removeGem(gem)
        }
    }
    
    func gameOver() {
        
        // When game is over let's check for new user record
        if score > highScore {
            highScore = score
            updateHighScoreLabelText()
        }
        
        startGame()
        
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
    
    func spawnGem(atPosition position: CGPoint) {
        
        // Creating sprite for diamond and adding him to the scene
        let gem = SKSpriteNode(imageNamed: "gem")
        gem.position = position
        gem.zPosition = 9
        addChild(gem)
        gem.physicsBody = SKPhysicsBody(rectangleOf: gem.size, center: gem.centerRect.origin)
        gem.physicsBody?.categoryBitMask = PhysicsCategory.gem
        gem.physicsBody?.affectedByGravity = false
        
        // Adding new diamond to the array of diamonds
        gems.append(gem)
        
    }
    
    func removeGem(_ gem: SKSpriteNode) {
        
        gem.removeFromParent()
        
        if let gemIndex = gems.firstIndex(of: gem) {
            gems.remove(at: gemIndex)
        }
        
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
                let brickY = (brickSize.height / 2.0) + brickLevel.rawValue
                
                // Making some gaps in the sidewalk so our hero should jump over them
                let randomNumber = arc4random_uniform(99)
                
                if randomNumber < 5 {
                    
                    // 5 % chance to spawn gaps between the sections
                    let gap = 20.0 * scrollSpeed
                    brickX += gap
                    
                    // In location of each gap
                    let randomGemYAmount = CGFloat(arc4random_uniform(150))
                    let newGemY = brickY + skater.size.height + randomGemYAmount
                    let newGemX = brickX - gap / 2
                    
                    spawnGem(atPosition: CGPoint(x: newGemX, y: newGemY))
                }
                
                else if randomNumber < 10 {
                    // 5 % chance to change lower section to the upper section and vice versa
                    if brickLevel == .high {
                        brickLevel = .low
                    }
                    else if brickLevel == .low {
                        brickLevel = .high
                    }
                }
                
                // Adding new section and updating position of farthest right
                let newBrick = spawnBrick(atPosition: CGPoint(x: brickX, y: brickY))
                farthestRightBrickX = newBrick.position.x
            
        }
    }
    
    func updateGems(withScrollAmount currentScrollAmount: CGFloat) {
        
        for gem in gems {
            
            // Update of each gem position
            let thisGemX = gem.position.x - currentScrollAmount
            gem.position = CGPoint(x: thisGemX, y: gem.position.y)
            
            // Delete all gems which is left from the screen
            if gem.position.x < 0.0 {
                
                removeGem(gem)
            }
        }
    }
    
    func updateSkater() {
        
        // Check is skater is on the ground or not
        if let velocityY = skater.physicsBody?.velocity.dy {
            
            if velocityY < -100.0 || velocityY > 100.0 {
                skater.isOnGround = false
            }
        }
        
        // Check should new game end or not
        let isOffScreen = skater.position.y < 0.0 || skater.position.x < 0.0
        
        let maxRotation = CGFloat(GLKMathDegreesToRadians(85.0))
        let isTippedOver = skater.zRotation > maxRotation || skater.zRotation < -maxRotation
        
        if isOffScreen || isTippedOver {
            gameOver()
        }
        
        
    }
    
    func updateScore(withCurrentTime currentTime: TimeInterval) {
        
        // Amount of points will be increased during the time of the game
        // Score is being updated every second
        
        let elapsedTIme = currentTime - lastScoreUpdateTime
        
        if elapsedTIme > 1.0 {
            
            // Add points
            score += Int(scrollSpeed)
            
            // Assing value of current time to lastScoreUpdateTime property
            lastScoreUpdateTime = currentTime
            
            updateScoreLabelText()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // calling after drowing each shot
        
        // Slowly increasing value of scrollSpeed during the game
        scrollSpeed += 0.01
        
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
        
        updateGems(withScrollAmount: currentScrollAmount)
        
        updateScore(withCurrentTime: currentTime)
    }
    
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        
        // Skater jumps when user clicks on the screen when she is on the ground
        if skater.isOnGround {
            
            skater.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 260.0))
        }
    }
    
    // MARK: - SKPhysicsContactDelegate Methods
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        // Check up for contact between skater and brick of sidewalk
        if contact.bodyA.categoryBitMask == PhysicsCategory.skater &&
            contact.bodyB.categoryBitMask == PhysicsCategory.brick {
            
            skater.isOnGround = true
        }
        
        else if contact.bodyA.categoryBitMask == PhysicsCategory.skater && contact.bodyB.categoryBitMask == PhysicsCategory.gem {
            
            // When skater touched the gem we will delete it
            if let gem = contact.bodyB.node as? SKSpriteNode {
                removeGem(gem)
                
                // User will collect 50 points for each gem
                score += 50
                updateScoreLabelText()
            }
        }
    }
}
