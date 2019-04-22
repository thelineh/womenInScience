import SpriteKit

public protocol ContainerProtocol {
    var background: SKSpriteNode {get set}
    init(size: CGSize)
}
