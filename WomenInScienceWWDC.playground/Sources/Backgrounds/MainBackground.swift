import SpriteKit

class MainBackground: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    init(size: CGSize) {
        //main background setup
        let bgTexture = SKTexture(noiseWithSmoothness: 0.65, size: CGSize(width: 60, height: 60), grayscale: false)
        super.init(texture: bgTexture, color: .green, size: size)
        
        self.position = CGPoint(x: size.width/2, y: size.height/2)
    }
}

