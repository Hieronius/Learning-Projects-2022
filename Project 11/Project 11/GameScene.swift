//
//  GameScene.swift
//  Project 11
//
//  Created by Арсентий Халимовский on 11.11.2022.
//

import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var scoreLabel: SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var editLabel: SKLabelNode!
    
    var editingMode: Bool = false {
        didSet {
            if editingMode {
                editLabel.text = "Done"
            } else {
                editLabel.text = "Edit"
            }
        }
    }
    
    var numbersOfBallsLabel: SKLabelNode!
    
    var numberOfBalls = 5 {
        didSet {
            numbersOfBallsLabel.text = "Balls: \(numberOfBalls)"
        }
    }
    
    var gameOver: SKLabelNode!
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 980, y: 700)
        addChild(scoreLabel)
        
        editLabel = SKLabelNode(fontNamed: "Chalkduster")
        editLabel.text = "Edit"
        editLabel.position = CGPoint(x: 80, y: 700)
        addChild(editLabel)
        
        numbersOfBallsLabel = SKLabelNode(fontNamed: "Chalkduster")
        numbersOfBallsLabel.horizontalAlignmentMode = .right
        numbersOfBallsLabel.text = "Balls: 5"
        numbersOfBallsLabel.position = CGPoint(x: 980, y: 650)
        addChild(numbersOfBallsLabel)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        
        gameOver = SKLabelNode(fontNamed: "Chalkduster")
        gameOver.horizontalAlignmentMode = .right
        gameOver.text = "Game over"
        gameOver.text
        gameOver.position = CGPoint(x: 600, y: 300)
        gameOver.isHidden = true
        addChild(gameOver)
        
        
//        if numberOfBalls == -1 {
//            print("game over")
//        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
         let location = touch.location(in: self)
        
        
        let objects = nodes(at: location)
        
        if objects.contains(editLabel) {
            editingMode.toggle()
        } else {
            if editingMode {
                // create a box
                let size = CGSize(width: Int.random(in: 16...128), height: 16)
                let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
                box.zRotation = CGFloat.random(in: 0...3)
                box.position = location
                box.name = "box"
                
                box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                box.physicsBody?.isDynamic = false
                addChild(box)
            } else {
            
                let arrayOfBalls = [SKSpriteNode(imageNamed: "ballRed"),
                                    SKSpriteNode(imageNamed: "ballBlue"),
                                    SKSpriteNode(imageNamed: "ballCyan"),
                                    SKSpriteNode(imageNamed: "ballGreen"),
                                    SKSpriteNode(imageNamed: "ballGrey"),
                                    SKSpriteNode(imageNamed: "ballPurple"),
                                    SKSpriteNode(imageNamed: "ballYellow"),]
                
                let ball = arrayOfBalls.randomElement()!
                ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
                ball.physicsBody?.restitution = 0.4
                ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
                ball.position.x = location.x
                ball.position.y = CGFloat(frame.maxY - 100)
                ball.name = "ball"
                addChild(ball)
                numberOfBalls -= 1
            
        }
        
            if numberOfBalls == -1 {
                print("game over")
                gameOver.isHidden = false
            }
        
    }
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
            sloteBase.name = "good"
        } else {
            sloteBase = SKSpriteNode(imageNamed: "slotBaseBad")
            sloteGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            sloteBase.name = "bad"
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
    
    func collision(between ball: SKNode, object: SKNode) {
        if object.name == "good" {
            destroyBalls(ball: ball)
            score += 1
            numberOfBalls += 1
        } else if object.name == "bad" {
        destroyBalls(ball: ball)
            score -= 1
        } else if object.name == "box" {
            destroyObstacles(obstacle: object)
        }
    }
    
    func destroyBalls(ball: SKNode) {
        if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
            fireParticles.position = ball.position
            addChild(fireParticles)
        }
        
        ball.removeFromParent()
    }
    
    func destroyObstacles(obstacle: SKNode) {
        obstacle.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "ball" {
            collision(between: nodeA, object: nodeB)
        } else if nodeB.name == "ball" {
            collision(between: nodeB, object: nodeA)
        }
    }
    }
