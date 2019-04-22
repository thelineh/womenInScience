import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 800))
let scene = WelcomeScene(size: sceneView.bounds.size)

sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
