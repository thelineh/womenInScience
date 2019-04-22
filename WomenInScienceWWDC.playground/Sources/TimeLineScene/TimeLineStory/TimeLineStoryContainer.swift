import SpriteKit

public class TimeLineStoryContainer: SKNode, ContainerProtocol {
    
    public var background = SKSpriteNode(texture: nil, color: UIColor.mainContainerColor, size: CGSize(width: 0, height: 0))
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    public required init(size: CGSize) {
        super.init()
        background = SKSpriteNode(color: .green, size: size)
        background.position = Sizes.timeLineStoryMiddleFramePoint
        addChild(background)
    }
    
    public init(size: CGSize, color: UIColor, position: CGPoint) {
        super.init()
        let background = SKSpriteNode(color: color, size: size)
        background.position = position
        addChild(background)
    }
    
    public init(size: CGSize, story: TimeLineStory, position: CGPoint) {
        super.init()
        
        background = SKSpriteNode(color: story.backgroundColor, size: size)
        background.position = position
        background.name = "Background"
        addChild(background)
        
        guard let textures = story.textures else {
            return
        }
        
        setContent(story.content, textures, at: position)
    }
    
    
    private func setContent(_ text: String, _ textures: [SKTexture], at position: CGPoint) {
        let label = SKLabelNode(attributedText: text.attributedString(font: .montserrat, size: 18, color: .titleColor))
        
        label.position = CGPoint(x: Sizes.timeLineStoryMiddleFramePoint.x, y: position.y + (Sizes.timeLineStorySize.height / 2))
        label.color = .black
        label.horizontalAlignmentMode = .center
        label.numberOfLines = 10
        label.verticalAlignmentMode = .top
        label.preferredMaxLayoutWidth = Sizes.timeLineStorySize.width - (2 * Sizes.characterContainerConstraint)
        label.lineBreakMode = .byWordWrapping
        
        addChild(label)
        
        let image = SKSpriteNode(texture: textures[0])
        
        let yPosition = label.position.y - (label.frame.height / 2) - (image.size.height / 2) - 80
        
        if yPosition > Sizes.timeLineStoryMiddleFramePoint.y {
            image.position = CGPoint(x: Sizes.timeLineStoryMiddleFramePoint.x, y: label.position.y - (label.frame.height / 2) - (image.size.height / 2) - 120)
        } else {
            image.position = CGPoint(x: Sizes.timeLineStoryMiddleFramePoint.x, y: label.position.y - Sizes.timeLineStoryMiddleFramePoint.y + 40 )
        }
        
        addChild(image)
            
        image.run(SKAction.repeatForever(
            SKAction.animate(with: textures,
                                timePerFrame: 0.15,
                                resize: false,
                                restore: true)),
                                withKey:"animation")
    }
    
    public func percentageToTop() -> CGFloat {
        let value = self.children[0].position.y + (self.children[0].frame.height / 2)
        
        return ( (value - (Sizes.timeLineStoryMiddleFramePoint.y + (Sizes.timeLineStorySize.height / 2))) * 100) / Sizes.timeLineStorySize.height
    }
}

