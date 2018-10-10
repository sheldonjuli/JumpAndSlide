//
//  Player.swift
//  JumpAndSlide
//
//  Created by Li Ju on 2018-10-09.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

/**
 A SKSpriteNode which captures all properties of an Player object.
 */
class Player: SKSpriteNode {
    
    private var playerColor: UIColor
    
    /**
     Initializes an Player.
     */
    init(view: SKView) {
        
        let radius = view.bounds.width / 20
        let playerNode = SKShapeNode(circleOfRadius: radius)
        playerNode.fillColor = .white
        playerNode.strokeColor = .clear
        playerNode.zPosition = ZPositions.player
        
        playerColor = .white
        
        super.init(texture: nil, color: .clear, size: CGSize(width: 2 * radius, height: 2 * radius))
        
        position = view.playerPosition
        
        constraints = [SKConstraint.positionX(SKRange(lowerLimit: 0, upperLimit: view.bounds.maxX))]
        
        physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody!.allowsRotation = false
        physicsBody!.categoryBitMask = PhysicsCategories.player
        physicsBody!.collisionBitMask = PhysicsCategories.none
        physicsBody!.contactTestBitMask = PhysicsCategories.block
        
        addChild(playerNode)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getColor() -> UIColor {
        return playerColor
    }
    
    func setColor(newColor: UIColor) {
        playerColor = newColor
    }
}
