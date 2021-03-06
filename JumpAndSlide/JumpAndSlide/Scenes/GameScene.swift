//
//  GameScene.swift
//  JumpAndSlide
//
//  Created by Li Ju on 2018-10-09.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    // MARK: Fields
    var sceneManagerDelegate: SceneManagerDelegate?
    
    var playRewardAdDelegate: PlayRewardAdDelegate?
    
    var isGamePaused = false
    var isDead = false
    private var isSecondLife = false
    
    var playVideoButton: SpriteKitButton?
    var cancelButton: SpriteKitButton?
    
    var player: Player!
    var motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        
        scene?.backgroundColor = .black
        
        setupGameScenePhysics()
        
        addPlayer()
        addBlock(every: 2)
        
        motionManager.startAccelerometerUpdates()
        
        updateScoreAndGameState(every: 1.0)
    }
    
    
    // This method is being called every frame
    override func didSimulatePhysics() {
        
        guard let view = view else { return }
        
        // Remove out of scene objects
        for object in children {
            if object.position.x < -100 || object.position.x > view.bounds.maxX + 100
            || object.position.y < -100 || object.position.y > view.bounds.maxY + 100 {
                object.removeFromParent()
            }
        }
        
        if let accelerometerData = motionManager.accelerometerData {

            let scale = 4 * view.bounds.width
            player.physicsBody?.velocity.dx = scale * CGFloat(accelerometerData.acceleration.x)
        }
        
    }
    
    /**
     Setup scene physics specific for the game scene.
     */
    private func setupGameScenePhysics() {
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        //physicsWorld.contactDelegate = self
        
    }
    
    /**
     Repetitively call updateScoreAndGameState() to update the score and game state.
     
     - Parameter second: time interval between creations.
     */
    func updateScoreAndGameState(every second: Double) {
        
        self.run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run{ self.updateScoreAndGameState() },
            SKAction.wait(forDuration: second)
            ])))
        
    }
    
    func updateScoreAndGameState() {
        
        if isDead {
            
            if isSecondLife {
                presentMenuScene(CommonValue.dontCare)
            } else {
                presentGetSecondLifePopup()
            }
        }
    }
    
    private func presentGetSecondLifePopup() {
        
        guard let view = self.view else { return }
        
        // Pause game
        isGamePaused = true
        self.isUserInteractionEnabled = false
        
        playVideoButton = SpriteKitButton(buttonImage: ImageNames.noAdsButton, action: playRewardAds, caseId: 0)
        playVideoButton?.position = view.playRewardAdsButtonPosition
        playVideoButton?.aspectScale(to: view.bounds.size, regardingWidth: true, multiplier: AspectScaleMultiplier.playRewardAdsButton)
        playVideoButton?.zPosition = ZPositions.hudLabel
        addChild(playVideoButton!)
        
        cancelButton = SpriteKitButton(buttonImage: ImageNames.cancelButton, action: presentMenuScene, caseId: CommonValue.dontCare)
        cancelButton?.position = view.cancelButtonPosition
        cancelButton?.aspectScale(to: view.bounds.size, regardingWidth: true, multiplier: AspectScaleMultiplier.cancelButton)
        cancelButton?.zPosition = ZPositions.hudLabel
        addChild(cancelButton!)
        
        
        if !checkIfRewardAdAvailable() {
            playVideoButton?.isUserInteractionEnabled = false
            playVideoButton?.alpha = 0.5
            self.run(SKAction.sequence([
                SKAction.wait(forDuration: RewardAdConstant.adNotAvailableWaitTime),
                SKAction.run{ self.presentMenuScene(CommonValue.dontCare) }
                ]))
        }
    }
    
    private func presentMenuScene(_: Int) {
        
        sceneManagerDelegate?.presentMenuScene()
        
    }
    
    private func checkIfRewardAdAvailable() -> Bool {
        
        return playRewardAdDelegate?.checkIfRewardAdAvailable() ?? false
        
    }
    
    
    private func playRewardAds(_: Int) {
        
        playRewardAdDelegate?.playRewardAd()
        
    }
    
    func rewardUserForWatchingAd() {
        
        isDead = false
        self.isUserInteractionEnabled = true
        isGamePaused = false
        isSecondLife = true
        playVideoButton?.removeFromParent()
        cancelButton?.removeFromParent()
        
    }
    
    func addPlayer() {
        guard let view = view else { return }
        player = Player(view: view)
        addChild(player)
    }
    
    func addBlock(every second: Double) {
        guard let view = view else { return }
        
        self.run(SKAction.repeatForever(SKAction.sequence([
            SKAction.run{ self.addChild(Block(view: view, level: 1)) },
            SKAction.wait(forDuration: second)
            ])))
    }
    
}
