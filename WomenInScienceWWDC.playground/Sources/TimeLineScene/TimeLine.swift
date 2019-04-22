import SpriteKit

class TimeLine: SKNode {
    
    var strokeHeight: CGFloat = 0.0
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    init(with items: Int) {
        super.init()
        let circlesHeight = CGFloat(integerLiteral: items) * Sizes.timeLineCircleHeight
        strokeHeight = (Sizes.timeLineMaximumHeigh - circlesHeight) / (CGFloat(integerLiteral: items) - 1)
        
        for i in 0..<items {
            let xValue = Sizes.timeLineFramePoint.x
            
            let yAux = ( CGFloat(integerLiteral: (i)) * (strokeHeight + Sizes.timeLineCircleHeight))
            let yValue = Sizes.timeLineFramePoint.y - yAux
            
            let node = TimeLineItem(at: CGPoint(x: xValue, y: yValue), i == 0 ? .enabled : .disabled, height: strokeHeight)
            
            node.name = "timeLineItem\(i)"
            
            addChild(node)
        }
    }
    
    func swipedTo(item: Int, percentage: CGFloat) {
        let xValue = Sizes.timeLineFramePoint.x
        
        let yAux = ( CGFloat(integerLiteral: (item)) * (strokeHeight + Sizes.timeLineCircleHeight))
        let yValue = Sizes.timeLineFramePoint.y - yAux
        
        let originalItemPoint = CGPoint(x: xValue, y: yValue)
        
        if children.count > (item + 1), percentage >= 0 {
            
            let child = children[item] as? TimeLineItem
            
            
            let height = (strokeHeight * percentage) / 100
            
            if child!.filledStrokeHeight > height {
                unfillNode(item: item + 1)
            }
            
            child?.swipedTo(position: originalItemPoint, height: height)
        }
        
        if percentage >= 99 {
            fillNode(item: item+1)
        }
        
    }

    func fillNode(item: Int) {
        if children.count > item {
            let child = childNode(withName: "timeLineItem\(item)") as? TimeLineItem
            
            let action = SKAction.fadeIn(withDuration: 0.2)
            self.run(action) {
                child?.fillNode(item: item)
            }
        }
    }
    
    func unfillNode(item: Int) {
        if children.count > item {
            let child = childNode(withName: "timeLineItem\(item)") as? TimeLineItem
            
            let action = SKAction.fadeIn(withDuration: 0.2)
            self.run(action) {
                child?.unfillNode()
            }
        }
    }
    
    func itemHeight(from item: Int) -> CGFloat {
        if children.count > item {
            let child = children[item] as? TimeLineItem
            
            if let height = child?.filledStrokeHeight {
                return height
            } else {
                return 0
            }
        }
        
        return 0.0
    }
}

