import SpriteKit

enum TimeLineItemType {
    case enabled
    case disabled
    
    var strokeColor: UIColor {
        switch self {
        case .enabled:
            return .mainButtonColor
        case .disabled:
            return .lightGray
        }
    }
    
    var fillColor: UIColor {
        switch self {
        case .enabled:
            return .mainButtonColor
        case .disabled:
            return .white
        }
    }
}

class TimeLineItem: SKNode {
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init(at position: CGPoint, _ type: TimeLineItemType, height: CGFloat) {
        super.init()
        let circle = SKShapeNode(circleOfRadius: 6)
        circle.lineWidth = 2
        circle.fillColor = type.fillColor
        circle.strokeColor = type.strokeColor
        circle.name = "circle"
        
        circle.position = position
        addChild(circle)
        
        if (position.y - (circle.frame.height / 2) - height) >  (2 * Sizes.characterContainerConstraint) {
            
            let bezierPath = UIBezierPath()
            let startPoint = CGPoint(x: position.x, y: position.y - (circle.frame.height / 2))
            let endPoint = CGPoint(x: position.x, y: position.y - (circle.frame.height / 2) - height)
            bezierPath.move(to: startPoint)
            bezierPath.addLine(to: endPoint)
            
            let pattern : [CGFloat] = [3.0, 3.0]
            let dashed = SKShapeNode(path: bezierPath.cgPath.copy(dashingWithPhase: 10, lengths: pattern))
            dashed.lineWidth = 2
            dashed.name = "dashedStroke"
            
            dashed.strokeColor = .lightGray
            self.addChild(dashed)
        }
    }
    
    func swipedTo(position: CGPoint, height: CGFloat) {
        
        filledStrokeHeight = height
        
        if let child = childNode(withName: "fillingStroke") {
            child.removeFromParent()
        }
        
        let bezierPath = UIBezierPath()
        let startPoint = CGPoint(x: position.x, y: position.y - Sizes.timeLineCircleHeight / 2)
        let endPoint = CGPoint(x: position.x, y: position.y - Sizes.timeLineCircleHeight / 2  - height)
        
        bezierPath.move(to: startPoint)
        bezierPath.addLine(to: endPoint)
        
        let node = SKShapeNode(path: bezierPath.cgPath)
        node.lineWidth = 2.5
        node.strokeColor = TimeLineItemType.enabled.strokeColor
        node.name = "fillingStroke"
        addChild(node)
    }
    
    var filledStrokeHeight: CGFloat = 0.0
    
    func fillNode(item: Int) {
        let child = childNode(withName: "circle") as? SKShapeNode
        
        if let child = childNode(withName: "fillingCircle") {
            child.removeFromParent()
        }
        
        let circle = SKShapeNode(circleOfRadius: 6)
        circle.lineWidth = 2
        circle.fillColor = .mainButtonColor
        circle.strokeColor = .mainButtonColor
        circle.name = "fillingCircle"
        
        if let midX = child?.frame.midX, let midY = child?.frame.midY {
            circle.position = CGPoint(x: midX, y: midY)
            addChild(circle)
        }
    }
    
    func unfillNode() {
        if let child = childNode(withName: "fillingCircle") {
            child.removeFromParent()
        }
    }
}

