import SpriteKit

class TimeLineScene: SKScene, SceneProtocol {
    
    private var movingY: CGFloat = 0
    private var yDirection: CGFloat = 0
    private var lastTouch: CGPoint = CGPoint.zero
    private var firstTouch: CGPoint = CGPoint.zero
    private var timeLine = TimeLine(with: 0)
    private var stories: [TimeLineStory] = []
    private var manager = TimeLineStoryManager()
    private var heightOfMovement: CGFloat = 0.0
    
    public required override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = .white
        
        let mainBackground = SKSpriteNode(color: .white, size: size)
        
        addChild(mainBackground)
    }
    
    init(size: CGSize, with woman: Women) {
        
        super.init(size: size)
        backgroundColor = .white
        
        let mainBackground = SKSpriteNode(color: .white, size: size)
        addChild(mainBackground)
        
        manager = TimeLineStoryManager(with: woman)
        addChild(manager)
        
        let womanName = "\(woman.name) \(woman.lastName)"
        
        setTitle(text: womanName)
        setBackButton()
        setTimeLine(with: woman.stories.count)
    }
    
    private func setTitle(text: String) {
        let label = SKLabelNode(attributedText: text.attributedString(font: .montserratBold, size: 32, color: .titleColor))
        
        label.position = CGPoint(x: Sizes.middleFrameX, y: Sizes.mainFrameSize.height - 2 * Sizes.mainContainerConstraint)

        label.color = .black
        label.horizontalAlignmentMode = .center
        label.numberOfLines = 1
        label.verticalAlignmentMode = .center
        label.preferredMaxLayoutWidth = 400
        label.lineBreakMode = .byWordWrapping
        
        addChild(label)
    }
    
    private func setBackButton() {
        let image = SKSpriteNode(imageNamed: "back_button.png")
        image.size = CGSize(width: 15, height: 25)
        image.position = CGPoint(x: 2 * Sizes.mainContainerConstraint, y: Sizes.mainFrameSize.height - 2 * Sizes.mainContainerConstraint)
        image.name = "backButton"
        addChild(image)
    }
    
    private func setTimeLine(with items: Int) {
        timeLine = TimeLine(with: items)
        addChild(timeLine)
        manager.timeLine = timeLine
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    func change(to scene: SKScene) {
        scene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene?.view?.presentScene(scene, transition: SKTransition.reveal(with: .right, duration: 0.1))
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        for node in nodes(at: touchLocation) {
            if node.name == "backButton" {
                let characterSelectionScene = CharacterSelectionScene(size: Sizes.mainFrameSize)
                change(to: characterSelectionScene)
            }
        }
        
        movingY = 0
        lastTouch = touch.location(in: self.scene!.view)
        firstTouch = touch.location(in: self.scene!.view)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        let movingPoint: CGPoint = touch.location(in: self.scene!.view)
        
        movingY = movingPoint.y - lastTouch.y
        yDirection = movingPoint.y - firstTouch.y
        
        let percentageOfScroll = ( movingY * -1 * 100 ) / (Sizes.timeLineStorySize.height - 200)
        
        heightOfMovement = (percentageOfScroll * 300) / 100
        
        manager.moveUpBy(height: heightOfMovement)
        
        lastTouch = movingPoint
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let firstIndex = Int(manager.smallestPercentageToTop()[0])
        let firstPercentage = manager.smallestPercentageToTop()[1]
        let secondIndex = Int(manager.smallestPercentageToTop()[2])
        let secondPercentage = manager.smallestPercentageToTop()[3]

        if yDirection > 0 {
            //going up
            if firstIndex == 0 && firstPercentage <= 0 {
                let position = manager.storyYPosition(item: firstIndex)
                let action = SKAction.move(to: Sizes.timeLineStoryMiddleFramePoint, duration: 0.2)
                self.run(action) {
                    let distance = Sizes.timeLineStoryMiddleFramePoint.y - position
                    self.manager.moveUpBy(height: distance)
                }
            } else {
                    let position = manager.storyYPosition(item: abs(secondPercentage) > 25 ? firstIndex : secondIndex)
                    let action = SKAction.move(to: Sizes.timeLineStoryMiddleFramePoint, duration: 0.2)
                    self.run(action) {
                        let distance = Sizes.timeLineStoryMiddleFramePoint.y - position
                        self.manager.moveUpBy(height: distance)
                        self.timeLine.swipedTo(item: firstIndex, percentage: abs(secondPercentage) > 25 ? 0.0 : 100.0)
                    }
            }
        } else {
            //going down
            if firstIndex == 3 && firstPercentage >= 0 {
                let position = manager.storyYPosition(item: firstIndex)
                let action = SKAction.move(to: Sizes.timeLineStoryMiddleFramePoint, duration: 0.2)
                self.run(action) {
                    let distance = Sizes.timeLineStoryMiddleFramePoint.y - position
                    self.manager.moveUpBy(height: distance)
                }
            } else {
                    let position = manager.storyYPosition(item: abs(firstPercentage) > 25 ? secondIndex : firstIndex)
                    let action = SKAction.move(to: Sizes.timeLineStoryMiddleFramePoint, duration: 0.2)
                    self.run(action) {
                        let distance = Sizes.timeLineStoryMiddleFramePoint.y - position
                        self.manager.moveUpBy(height: distance)
                        self.timeLine.swipedTo(item: firstIndex, percentage: abs(firstPercentage) > 25 ? 100.0 : 0.0)
                    }
                }
            
        }
    }
}
