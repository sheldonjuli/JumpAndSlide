//
//  Block.swift
//  JumpAndSlide
//
//  Created by Li Ju on 2018-10-10.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

/**
 A SKSpriteNode which captures all properties of an Player object.
 */
class Block: SKSpriteNode {
    
    /**
     Initializes an Player.
     */
    init(view: SKView, level: Int) {
        
        let h = view.bounds.height / 20
        let w = view.bounds.width
        let blockNodeSize = CGSize(width: w, height: h)
        let blockNode = SKShapeNode(rectOf: blockNodeSize)
        blockNode.fillColor = .gray
        blockNode.strokeColor = .clear
        blockNode.zPosition = ZPositions.block
        
        super.init(texture: nil, color: .clear, size: blockNodeSize)
        
        position = view.blockStartingPosition
        
        physicsBody = SKPhysicsBody(rectangleOf: blockNodeSize)
        physicsBody!.allowsRotation = false
        physicsBody!.categoryBitMask = PhysicsCategories.block
        physicsBody!.collisionBitMask = PhysicsCategories.none
        physicsBody!.contactTestBitMask = PhysicsCategories.player
        
        physicsBody!.velocity.dy = -view.bounds.height / 10
        physicsBody!.linearDamping = 0
        
        addChild(blockNode)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
