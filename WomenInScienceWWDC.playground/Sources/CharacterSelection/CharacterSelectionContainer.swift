import SpriteKit

class CharacterSelectionContainer: SKNode, ContainerProtocol {
    
    var background = SKSpriteNode(color: .white, size: CGSize(width: 0, height: 0))
    
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
        setCharactersSelection()
    }
    
    private func setCharactersSelection() {
        let adaContainer = CharacterContainer(size: Sizes.characterContainerSize, position: CGPoint(x: Sizes.middleFrameX - Sizes.characterMiddleFrameX + Sizes.characterContainerConstraint, y: Sizes.middleFrameY - Sizes.characterMiddleFrameY + (3 * Sizes.characterContainerConstraint) + (2 * Sizes.characterContainerSize.height)), woman: .adaLovelace)
        addChild(adaContainer)
        
        let graceContainer = CharacterContainer(size: Sizes.characterContainerSize, position: CGPoint(x: Sizes.middleFrameX - Sizes.characterMiddleFrameX + Sizes.characterContainerConstraint, y: Sizes.middleFrameY - Sizes.characterMiddleFrameY + (2 * Sizes.characterContainerConstraint) + Sizes.characterContainerSize.height), woman: .graceHopper)
        addChild(graceContainer)
        
        let katherineContainer = CharacterContainer(size: Sizes.characterContainerSize, position: CGPoint(x: Sizes.middleFrameX - Sizes.characterMiddleFrameX + Sizes.characterContainerConstraint, y: Sizes.middleFrameY - Sizes.characterMiddleFrameY + Sizes.characterContainerConstraint), woman: .katherineJohnson)
        addChild(katherineContainer)
    }
}

