import SpriteKit

public class TimeLineStoryManager: SKCropNode {
    
    var timeLine = TimeLine(with: 0)
    
    public var storyContainers: [TimeLineStoryContainer] = []
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    override init() {
        super.init()
        
        maskNode = SKSpriteNode(color: .white, size: Sizes.timeLineStorySize)
        maskNode?.position = Sizes.timeLineStoryMiddleFramePoint
    }
    
    init(with woman: Women) {
        super.init()
        
        maskNode = SKSpriteNode(color: .white, size: Sizes.timeLineStorySize)
        maskNode?.position = Sizes.timeLineStoryMiddleFramePoint

        setupStories(with: woman.stories)
    }
    
    func setupStories(with stories: [TimeLineStory]) {
        
        for i in 0..<stories.count {
            let child = TimeLineStoryContainer(size: Sizes.timeLineStorySize, story: stories[i], position: CGPoint(x: Sizes.timeLineStoryMiddleFramePoint.x, y: Sizes.timeLineStoryMiddleFramePoint.y - (CGFloat(integerLiteral: i) * Sizes.timeLineStorySize.height)))
            storyContainers.append(child)
            addChild(child)
        }
    }
    
    func storyYPosition(item: Int) -> CGFloat {
        return storyContainers[item].children[0].position.y
    }
    
    func moveUpBy(height: CGFloat) {
        storyContainers.forEach {
            $0.children[0].position.y += height
            $0.children[1].position.y += height
            
            if $0.children.count >= 3 {
                $0.children[2].position.y += height
            }

            moveTimeLine()
        }
    }
    
    func smallestPercentageToTop() -> [CGFloat] {
        let percentages = storyContainers.map({$0.percentageToTop()})
        let values = percentages.filter({abs($0) < 100.0})
        
        guard let firstValue = values.first, let indexOfFirst = percentages.firstIndex(of: firstValue)else {
            return [0.0, 0.0, 0.0, 0.0]
        }
        
        guard let lastValue = values.last, let indexOfSecond = percentages.firstIndex(of: lastValue) else {
            return [CGFloat(integerLiteral: indexOfFirst), firstValue, 0.0, 0.0]
        }

        return [CGFloat(integerLiteral: indexOfFirst), firstValue, CGFloat(integerLiteral: indexOfSecond), lastValue]
    }
    
    func moveTimeLine() {
        let percentages = storyContainers.map({$0.percentageToTop()})
        let values = percentages.filter({abs($0) < 100.0})
        
        guard let firstValue = values.first, let indexOfFirst = percentages.firstIndex(of: firstValue)else {
            return
        }
        
        timeLine.swipedTo(item: indexOfFirst, percentage: firstValue)
    }
}


