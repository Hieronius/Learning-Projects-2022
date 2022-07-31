

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
        
        // If number of points was granted to the method, let's display label on the screen
        if let scoreToDisplay = score {
            
            // Making a text with amount of points from score
            let scoreString = String(format: "Points:%04d", scoreToDisplay)
            let scoreLabel: SKLabelNode = SKLabelNode(text: scoreString)
            
            // Setting a starting position of label in the right from menu layer
            let scoreLabelX = frame.width
            let scoreLabelY = messageLabel.position.y - messageLabel.frame.height
            scoreLabel.position = CGPoint(x: scoreLabelX, y: scoreLabelY)
            
            scoreLabel.horizontalAlignmentMode = .center
            scoreLabel.fontName = "Courier-Bold"
            scoreLabel.fontSize = 32.0
            scoreLabel.zPosition = 20
            addChild(scoreLabel)
            
            // Animate movement of label to the center
            let scoreAction = SKAction.moveTo(x: finalX, duration: 0.3)
            scoreLabel.run(scoreAction)
        }
    }
}
