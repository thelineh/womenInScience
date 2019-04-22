import SpriteKit

class ExplanationContainer: SKNode, ContainerProtocol {
    
    var background = SKSpriteNode(texture: nil, color: UIColor.mainContainerColor, size: CGSize(width: 0, height: 0))
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    required init(size: CGSize) {
        super.init()
        
        let shadow = SKSpriteNode(texture: nil, size: CGSize(width: size.width + 20, height: size.height + 20))
        shadow.blendMode = SKBlendMode.alpha
        shadow.colorBlendFactor = 5
        shadow.color = .black
        shadow.alpha = 0.15
        
        shadow.position = Sizes.middleFramePoint
        addChild(shadow)
        
        background = SKSpriteNode(color: UIColor.mainContainerColor, size: size)
        background.position = Sizes.middleFramePoint
        
        addChild(background)
        setMessages()
        setButton()
    }
    
    private func setButton() {
        let button = Button(with: CGSize(width: 150, height: 40), text: "I'm in!", and: CGPoint(x: Sizes.middleFrameX, y: Sizes.middleFrameY - (background.frame.height / 2) + (2 * Sizes.mainContainerConstraint)))
        button.name = "startButton"
        addChild(button)
    }
    
    private func setMessages() {
        
        let titleText = "Women in Tech"
        let title = SKLabelNode(attributedText: titleText.attributedString(font: .montserratBold, size: 28, color: .titleColor))
        
        title.position = CGPoint(x: Sizes.middleFrameX, y: Sizes.middleFrameY + (background.frame.height / 2) - Sizes.mainContainerConstraint)
        title.horizontalAlignmentMode = .center
        title.numberOfLines = 1
        title.verticalAlignmentMode = .top
        title.preferredMaxLayoutWidth = 400
        title.lineBreakMode = .byWordWrapping
        
        addChild(title)
        
        let bodyText = "During the month of march, we celebrate the International Women's Day, besides it being considered Women's History Month in some countries. Those events were created so we would keep alive the memory and the history of thousands of women who struggled and battled for us to have our rights. \nWomen had a hard time getting space and acknowledgment into some areas of expertise, such as technology, for being considered inferior or incapable of the tasks.\n\nDo you know the history of women in programming? \nToday we'll have the opportunity to get to know about the inspiring lives of three women who left a mark in the history of computing."
        
        let body = SKLabelNode(attributedText: bodyText.attributedString(font: .openSans, size: 16, color: .textBodyColor))
        
        body.position = CGPoint(x: Sizes.middleFrameX - (background.frame.width / 2) + Sizes.mainContainerConstraint, y: title.position.y - (2 * Sizes.mainContainerConstraint))
        body.fontColor = .black
        body.horizontalAlignmentMode = .left
        body.numberOfLines = 10
        body.verticalAlignmentMode = .top
        body.preferredMaxLayoutWidth = background.frame.width - (2 * Sizes.mainContainerConstraint)
        
        body.lineBreakMode = .byClipping
        addChild(body)
    }
}

