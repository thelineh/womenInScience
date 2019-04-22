import SpriteKit

public class Sizes {
    static let mainFrameSize = CGSize(width: 500, height: 800)
    static let middleFramePoint = CGPoint(x: Sizes.mainFrameSize.width / 2, y: Sizes.mainFrameSize.height / 2)
    static let middleFrameX = Sizes.mainFrameSize.width / 2
    static let middleFrameY = Sizes.mainFrameSize.height / 2
    
    static let characterFrameSize = CGSize(width: 400, height: 570)
    static let characterMiddleFrameX = Sizes.characterFrameSize.width / 2
    static let characterMiddleFrameY = Sizes.characterFrameSize.height / 2
    
    static let characterContainerSize = CGSize(width: 340, height: 150)
    
    static let mainContainerConstraint: CGFloat = 20.0
    static let characterContainerConstraint: CGFloat = 30.0
    
    static let timeLineFramePoint = CGPoint(x: 2 * Sizes.mainContainerConstraint, y: Sizes.mainFrameSize.height - (4 * Sizes.characterContainerConstraint))
    static let timeLineMaximumHeigh: CGFloat = Sizes.timeLineFramePoint.y - (2 * Sizes.characterContainerConstraint)
    static let timeLineCircleRadius: CGFloat = 6
    static let timeLineCircleHeight: CGFloat = {
        let circle = SKShapeNode(circleOfRadius: Sizes.timeLineCircleRadius)
        circle.lineWidth = 2
        return circle.frame.height - 2
    }()
    
    static let timeLineStorySize = CGSize(width: Sizes.mainFrameSize.width - (6 * Sizes.mainContainerConstraint), height: Sizes.timeLineMaximumHeigh)
    static let timeLineStoryMiddleFramePoint = CGPoint(x: Sizes.middleFrameX + Sizes.mainContainerConstraint, y: Sizes.middleFrameY - Sizes.mainContainerConstraint)
}
