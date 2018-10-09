//
//  MenuScene.swift
//  JumpAndSlide
//
//  Created by Li Ju on 2018-10-09.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        
        setupMenu(view: view)
    }
    
    func setupMenu(view: SKView) {
        
        scene?.backgroundColor = .black
        
        let tapToStartNode = SKLabelNode(text: "Tap to Start!")
        tapToStartNode.fontName = "ChalkboardSE-Bold"
        tapToStartNode.fontSize = view.bounds.width / 15
        tapToStartNode.position = view.tapToStartImgPosition
        tapToStartNode.zPosition = ZPositions.hudLabel
        tapToStartNode.fontColor = .white
        addChild(tapToStartNode)
        
        let zoomOut = SKAction.scale(by: 1.5, duration: 1)
        let zoomInAndOut = SKAction.repeatForever(SKAction.sequence([
            zoomOut,
            zoomOut.reversed()
            ]))
        tapToStartNode.run(zoomInAndOut)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        goToGameScene()
    }
    
    func goToGameScene() {
        sceneManagerDelegate?.presentGameScene()
    }
}
