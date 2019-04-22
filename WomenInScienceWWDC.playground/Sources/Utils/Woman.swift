import SpriteKit

enum Women {
    case adaLovelace
    case graceHopper
    case katherineJohnson
    
    var name: String {
        switch self {
        case .adaLovelace:
            return "ada"
        case .graceHopper:
            return "grace"
        case .katherineJohnson:
            return "katherine"
        }
    }
    
    var lastName: String {
        switch self {
        case .adaLovelace:
            return "lovelace"
        case .graceHopper:
            return "hopper"
        case .katherineJohnson:
            return "johnson"
        }
    }
    
    var color: UIColor {
        switch self {
        case .adaLovelace:
            return .darkerPinkColor
        case .graceHopper:
            return .purpleContainerColor
        case .katherineJohnson:
            return .blueContainerColor
        }
    }
    
    var mainImage: String {
        switch self {
        case .adaLovelace:
            return "ada3.png"
        case .graceHopper:
            return "grace.png"
        case .katherineJohnson:
            return "katherine.png"
        }
    }
    
    var mainImageSize: CGSize {
        switch self {
        case .adaLovelace:
            return CGSize(width: 150, height: 150)
        case .graceHopper:
            return CGSize(width: 225, height: 180)
        case .katherineJohnson:
            return CGSize(width: 160, height: 220)
        }
    }
    
    var stories: [TimeLineStory] {
        
        let bugAnimationTexture = [SKTexture(imageNamed: "bug 2.png"),
                                   SKTexture(imageNamed: "bug 3.png"),
                                   SKTexture(imageNamed: "bug 4.png"),
                                   SKTexture(imageNamed: "bug 5.png"),
                                   SKTexture(imageNamed: "bug 6.png"),
                                   SKTexture(imageNamed: "bug 7.png"),
                                   SKTexture(imageNamed: "bug 8.png"),
                                   SKTexture(imageNamed: "bug 9.png"),
                                   SKTexture(imageNamed: "bug 10.png"),
                                   SKTexture(imageNamed: "bug 11.png")]
        
        let computerAnimationTexture = [SKTexture(imageNamed: "computer1.png"),
                                       SKTexture(imageNamed: "computer2.png"),
                                       SKTexture(imageNamed: "computer3.png"),
                                       SKTexture(imageNamed: "computer4.png"),
                                       SKTexture(imageNamed: "computer5.png"),
                                       SKTexture(imageNamed: "computer6.png"),
                                       SKTexture(imageNamed: "computer7.png"),
                                       SKTexture(imageNamed: "computer8.png"),
                                       SKTexture(imageNamed: "computer9.png"),
                                       SKTexture(imageNamed: "computer10.png"),
                                       SKTexture(imageNamed: "computer11.png"),
                                       SKTexture(imageNamed: "computer12.png"),
                                       SKTexture(imageNamed: "computer13.png"),
                                       SKTexture(imageNamed: "computer14.png"),
                                       SKTexture(imageNamed: "computer15.png"),
                                       SKTexture(imageNamed: "computer16.png"),
                                       SKTexture(imageNamed: "computer17.png"),
                                       SKTexture(imageNamed: "computer18.png"),
                                       SKTexture(imageNamed: "computer19.png")]
        
        let crowdAnimationTexture = [SKTexture(imageNamed: "crowd2.png"),
                                        SKTexture(imageNamed: "crowd3.png"),
                                        SKTexture(imageNamed: "crowd4.png"),
                                        SKTexture(imageNamed: "crowd5.png"),
                                        SKTexture(imageNamed: "crowd6.png"),
                                        SKTexture(imageNamed: "crowd7.png"),
                                        SKTexture(imageNamed: "crowd8.png"),
                                        SKTexture(imageNamed: "crowd9.png"),
                                        SKTexture(imageNamed: "crowd10.png"),
                                        SKTexture(imageNamed: "crowd11.png"),
                                        SKTexture(imageNamed: "crowd12.png"),
                                        SKTexture(imageNamed: "crowd13.png"),
                                        SKTexture(imageNamed: "crowd14.png"),
                                        SKTexture(imageNamed: "crowd15.png"),
                                        SKTexture(imageNamed: "crowd16.png"),
                                        SKTexture(imageNamed: "crowd17.png")]
        
        let moonAnimationTexture = [SKTexture(imageNamed: "moon_w_flag 2.png"),
                                     SKTexture(imageNamed: "moon_w_flag 3.png"),
                                     SKTexture(imageNamed: "moon_w_flag 4.png"),
                                     SKTexture(imageNamed: "moon_w_flag 5.png"),
                                     SKTexture(imageNamed: "moon_w_flag 6.png"),
                                     SKTexture(imageNamed: "moon_w_flag 7.png"),
                                     SKTexture(imageNamed: "moon_w_flag 8.png"),
                                     SKTexture(imageNamed: "moon_w_flag 9.png"),
                                     SKTexture(imageNamed: "moon_w_flag 10.png"),
                                     SKTexture(imageNamed: "moon_w_flag 11.png"),
                                     SKTexture(imageNamed: "moon_w_flag 12.png")]
        
        let cardAnimationTexture = [SKTexture(imageNamed: "punched_card1.png"),
                                    SKTexture(imageNamed: "punched_card2.png"),
                                    SKTexture(imageNamed: "punched_card3.png"),
                                    SKTexture(imageNamed: "punched_card4.png"),
                                    SKTexture(imageNamed: "punched_card5.png"),
                                    SKTexture(imageNamed: "punched_card6.png"),
                                    SKTexture(imageNamed: "punched_card7.png"),
                                    SKTexture(imageNamed: "punched_card8.png"),
                                    SKTexture(imageNamed: "punched_card9.png"),
                                    SKTexture(imageNamed: "punched_card10.png"),
                                    SKTexture(imageNamed: "punched_card11.png"),
                                    SKTexture(imageNamed: "punched_card12.png"),
                                    SKTexture(imageNamed: "punched_card13.png"),
                                    SKTexture(imageNamed: "punched_card14.png"),
                                    SKTexture(imageNamed: "punched_card15.png")]
        
        
        switch self {
        case .adaLovelace:
            return [TimeLineStory(bgColor: .white, content: "Ada Lovelace was a writer and mathematician who wrote what can be described as the first complex computer program, built to run on Charles Babbage's Analytical Engine, during the 19th century.", textures: [SKTexture(imageNamed: "ada3.png")]),
            TimeLineStory(bgColor: .white, content: "The engine was a precursor of the first computers, and was built to perform operations wrote on punched cards.", textures: cardAnimationTexture),
            TimeLineStory(bgColor: .white, content: "Ada wrote detailed notes about the engine and described a complex algorithm to calculate Bernoulli's numbers using the concept of looping, never seen before.", textures: [SKTexture(imageNamed: "bernoulli.png")]),
            TimeLineStory(bgColor: .white, content: "She also visualized that the Analytical Engine could do more than calculations. She predicted that it could, for example, compose music and produce graphics. She was not wrong!", textures: computerAnimationTexture)]
        case .graceHopper:
            return [TimeLineStory(bgColor: .white, content: "Grace was a rear admiral in the US Navy and a pioneer in computer technology development.", textures: [SKTexture(imageNamed: "grace3.png")]),
                    TimeLineStory(bgColor: .white, content: "The term bug we use today to refer to a program's failure was created by Grace, as a moth entered in a machine and caused some unexpected behaviour.", textures: bugAnimationTexture),
                    TimeLineStory(bgColor: .white, content: "Grace designed and improved the compiler, a program responsible for translating programming code into computer code. This made it possible for programming languages to be closer to human languages.", textures: [SKTexture(imageNamed: "swift.png")])]
        case .katherineJohnson:
            return [TimeLineStory(bgColor: .white, content: "Katherine Johnson was an african american mathematician who worked as a 'human computer' helping determine the flight paths for NASA's manned missions to space." , textures: [SKTexture(imageNamed: "katherine2.png")]),
                    TimeLineStory(bgColor: .white, content: "She was responsible for the calculations that took the first american to space, as well as calculating important informations for the Apollo missions to the moon.", textures: moonAnimationTexture),
                    TimeLineStory(bgColor: .white, content: "During the 60's, electronic computers were used to make those calculations, but Johnson was so trusted that many information provided by the computers were rechecked by her.", textures: [SKTexture(imageNamed: "calculation2.png")]),
                    TimeLineStory(bgColor: .white, content: "Katherine also educated black women to work with STEM, helping them advance in their careers.", textures: crowdAnimationTexture)]
        }
    }
}
