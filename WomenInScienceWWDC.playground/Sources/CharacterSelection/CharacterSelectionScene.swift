import SpriteKit

class CharacterSelectionScene: SKScene, SceneProtocol {
    required override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = .white
        
        let mainBackground = MainBackground(size: size)
        addChild(mainBackground)
        
        let characterSelectionContainer = CharacterSelectionContainer(size: CGSize(width: 400, height: 570))
        
        addChild(characterSelectionContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        var timeLineScene = TimeLineScene(size: .zero)
        
        for node in nodes(at: touchLocation) {
            switch node.name {
            case "ada":
                timeLineScene = TimeLineScene(size: self.calculateAccumulatedFrame().size, with: .adaLovelace)
            case "grace":
                timeLineScene = TimeLineScene(size: self.calculateAccumulatedFrame().size, with: .graceHopper)
            case "katherine":
                timeLineScene = TimeLineScene(size: self.calculateAccumulatedFrame().size, with: .katherineJohnson)
            default:
                break
            }
        }
        
        change(to: timeLineScene)
    }
    
    func change(to scene: SKScene) {
        scene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene?.view?.presentScene(scene, transition: SKTransition.push(with: .left, duration: 0.1))
    }
}

