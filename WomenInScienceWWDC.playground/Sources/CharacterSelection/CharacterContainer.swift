import SpriteKit

class CharacterContainer: SKNode, ContainerProtocol {
    
    var background = SKSpriteNode(color: .white, size: CGSize(width: 0, height: 0))
    var backgroundShape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    required init(size: CGSize) {
        super.init()
        
        background = SKSpriteNode(color: UIColor.mainContainerColor, size: size)
        background.position = Sizes.middleFramePoint
        addChild(background)
        setCharactersDetail(for: .adaLovelace)
    }
    
    init(size: CGSize, position: CGPoint, woman: Women) {
        super.init()
        
        backgroundShape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: size.height * 0.1)
        
        backgroundShape.fillColor = woman.color
        backgroundShape.strokeColor = woman.color
        
        backgroundShape.position = position
        addChild(backgroundShape)
        setCharactersDetail(for: woman)
        
        self.name = woman.name
    }
    
    private func setCharactersDetail(for woman: Women) {
        let name = SKLabelNode(attributedText: woman.name.attributedString(font: .montserrat, size: 24, color: .mainButtonTextColor))
        
        name.position = CGPoint(x: backgroundShape.position.x + 30, y: backgroundShape.position.y + 60)
        name.horizontalAlignmentMode = .left
        name.preferredMaxLayoutWidth = background.frame.width
        name.numberOfLines = 1
        name.lineBreakMode = .byTruncatingTail
        addChild(name)
        
        let lastName = SKLabelNode(attributedText: woman.lastName.attributedString(font: .montserratBold, size: 28, color: .mainButtonTextColor))
    
        lastName.position = CGPoint(x: backgroundShape.position.x + 30, y: backgroundShape.position.y + 30)
        lastName.horizontalAlignmentMode = .left
        lastName.preferredMaxLayoutWidth = background.frame.width
        lastName.numberOfLines = 1
        lastName.lineBreakMode = .byTruncatingTail
        addChild(lastName)
        
        let image = SKSpriteNode(imageNamed: woman.mainImage)
        image.size = woman.mainImageSize
        image.position = CGPoint(x: backgroundShape.frame.midX + 80, y: backgroundShape.frame.midY + 30)
        addChild(image)
    }
}


