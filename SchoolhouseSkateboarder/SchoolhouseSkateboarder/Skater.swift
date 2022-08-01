import SpriteKit

class Skater: SKSpriteNode {

    var velocity = CGPoint.zero
    var minimumY: CGFloat = 0.0
    var jumpSpeed: CGFloat = 20.0
    var isOnGround = true
    
    func setupPhysicsBody() {
        
        if let skaterTexture = texture {
            physicsBody = SKPhysicsBody(texture: skaterTexture, size: size)
            physicsBody?.isDynamic = true
            physicsBody?.density = 6.0
            physicsBody?.allowsRotation = false
            physicsBody?.angularDamping = 1.0
            
            physicsBody?.categoryBitMask = PhysicsCategory.skater
            physicsBody?.collisionBitMask = PhysicsCategory.brick
            physicsBody?.contactTestBitMask = PhysicsCategory.brick | PhysicsCategory.gem
        }
    }
    
    func createSparks() {
        
        // Find a file of particle emitter
        let bundle = Bundle.main
        if let sparkPath = bundle.path(forResource: "sparks", ofType: "sks") {
            
            // Create sprite of partice emitter
            let sparksNode = NSKeyedUnarchiver.unarchiveObject(withFile: sparkPath) as! SKEmitterNode
            sparksNode.position = CGPoint(x: 0.0, y: -50)
            addChild(sparksNode)
            
            // Taking action, waiting for half of the second and after deleting emitter
            let waitAction = SKAction.wait(forDuration: 0.5)
            let removeAction = SKAction.removeFromParent()
            let waitThenRemove = SKAction.sequence([waitAction, removeAction])
            sparksNode.run(waitThenRemove)
        }
    }
    
}
