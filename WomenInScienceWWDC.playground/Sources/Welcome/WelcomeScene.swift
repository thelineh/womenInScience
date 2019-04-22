//
//  WelcomeScene.swift
//  WomenInScience
//
//  Created by Aline Ghizzi on 24/02/19.
//  Copyright © 2019 Aline Ghizzi. All rights reserved.
//

import Foundation
import SpriteKit

public class WelcomeScene: SKScene, SceneProtocol {
    public required override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = .white
        
        let mainBackground = MainBackground(size: size)
        addChild(mainBackground)
        
        let explanationContainer = ExplanationContainer(size: CGSize(width: 400, height: 520))
        
        addChild(explanationContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported.")
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        for node in nodes(at: touchLocation) {
            if node.name == "startButton" {
                let characterSelectionScene = CharacterSelectionScene(size: self.calculateAccumulatedFrame().size)
                change(to: characterSelectionScene)
            }
        }
    }
    
    public func change(to scene: SKScene) {
        scene.scaleMode = SKSceneScaleMode.aspectFill
        self.scene?.view?.presentScene(scene, transition: SKTransition.reveal(with: .left, duration: 0.1))
    }
}
