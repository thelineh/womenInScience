import SpriteKit

public protocol SceneProtocol {
    init(size: CGSize)
    func change(to scene: SKScene)
}
