

import UIKit
import SpriteKit

class MenuLayer: SKSpriteNode {
    
    // displays the message and sometimes user score
    func display(message: String, score: Int?) {
        
        // Creating label of message with accepted message
        let messageLabel: SKLabelNode = SKLabelNode(text: message)
        
        // Setting starting position of label in left side of the menu layer
        let messageX = -frame.width
        let messageY = frame.height / 2.0
        messageLabel.position = CGPoint(x: messageX, y: messageY)
        
        messageLabel.horizontalAlignmentMode = .center
        messageLabel.fontName = "Courier-Bold"
        messageLabel.fontSize = 48.0
        messageLabel.zPosition = 20
        addChild(messageLabel)
        
        // Animate label movement to the center of the screen
        let finalX = frame.width / 2.0
        let messageAction = SKAction.moveTo(x: finalX, duration: 0.3)
        messageLabel.run(messageAction)
    }
}
