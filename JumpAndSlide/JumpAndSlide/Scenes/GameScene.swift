//
//  GameScene.swift
//  JumpAndSlide
//
//  Created by Li Ju on 2018-10-09.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: Fields
    var sceneManagerDelegate: SceneManagerDelegate?
    
    var playRewardAdDelegate: PlayRewardAdDelegate?
    
    var isGamePaused = false
    var isDead = false
    private var isSecondLife = false
    
    var playVideoButton: SpriteKitButton?
    var cancelButton: SpriteKitButton?
    
    override func didMove(to view: SKView) {
        
        scene?.backgroundColor = .black
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
    
}
