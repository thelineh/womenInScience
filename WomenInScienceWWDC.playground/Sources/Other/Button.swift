import Foundation
import SpriteKit

public class Button: SKNode {
    
    var background: SKShapeNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init(with size: CGSize, text: String, and position: CGPoint) {
        super.init()        
        //self.isUserInteractionEnabled = true
        
        setBackground(with: size, and: position)
        setText(text)
    }
    
    init(with size: CGSize, and position: CGPoint) {
        super.init()
        //self.isUserInteractionEnabled = true
        setBackground(with: size, and: position)
    }
    
    private func setBackground(with size: CGSize, and position: CGPoint) {
        background = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: size.height / 2)
        background.fillColor = UIColor.mainButtonColor
        background.strokeColor = UIColor.mainButtonColor
        
        background.position = CGPoint(x: position.x - size.width / 2, y: position.y - size.height / 2)
        
        addChild(background)
    }
    
    private func setText(_ text: String) {
        let label = SKLabelNode(attributedText: text.attributedString(font: .montserratBold, size: 18, color: .mainButtonTextColor))
        
        label.position = CGPoint(x: background.frame.midX, y: background.frame.midY)
        label.verticalAlignmentMode = .center
        label.preferredMaxLayoutWidth = background.frame.width
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        addChild(label)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
