import Foundation
import SpriteKit
import UIKit

public class AnimationScene: SKScene {
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    public override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = .magenta
        addEmoji()
        animateNodes(self.children)
    }
    
    func addEmoji() {
        let allEmoji: [Character] = ["🌯", "🌮", "🍔", "🍕"]
        let distance = floor(self.size.width / 4)
        
        for (index, emoji) in allEmoji.enumerated() {
            let node = SKLabelNode()
            node.renderEmoji(emoji)
            node.position.y = floor(self.size.height / 2)
            node.position.x = distance * (CGFloat(index) + 0.5)
            addChild(node)
        }
    }
    
    func animateNodes(_ nodes: [SKNode]) {
        for (index, node) in nodes.enumerated() {
            node.run(.sequence([
                .wait(forDuration: TimeInterval(index) * 0.2),
                .repeatForever(.sequence([
                    .scale(to: 1.5, duration: 0.3),
                    .scale(to: 1, duration: 0.3),
                    .wait(forDuration: 2)
                    ]))
                ]))
        }
    }
    
    public override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Motion began")
        print(motion)
    }
}

extension SKLabelNode {
    func renderEmoji(_ emoji: Character) {
        fontSize = 50
        text = String(emoji)
        
        // This enables us to move the label using its center point
        verticalAlignmentMode = .center
        horizontalAlignmentMode = .center
    }
}

