import SpriteKit

public class TimeLineStory: Equatable {
    
    var backgroundColor: UIColor
    var content: String
    var textures: [SKTexture]?
    
    init(bgColor: UIColor, content: String, textures: [SKTexture]? = nil) {
        self.backgroundColor = bgColor
        self.content = content
        self.textures = textures
    }
    
    static public func ==(lhs: TimeLineStory, rhs: TimeLineStory) -> Bool {
        return  lhs.backgroundColor == rhs.backgroundColor && lhs.content == rhs.content

    }
}

