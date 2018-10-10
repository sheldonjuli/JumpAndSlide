//
//  Constants.swift
//  JumpAndSlide
//
//  Created by Li Ju on 2018-10-09.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

struct CommonValue {
    static let dontCare = 0
}

struct GamePlayConstant {
}

struct ImageNames {
    
    // Shared
    
    // Menu Scene

    // Game Scene
    static let noAdsButton = "noAdsButton"
    static let cancelButton = "cancelButton"
    
}

struct AnchorPoints {
    static let sceneBackground = CGPoint(x: 0.5, y: 0.5)
}

struct ZPositions {
    static let sceneBackground: CGFloat = 1
    static let sceneBackgroundDeco: CGFloat = 2
 
    static let block: CGFloat = 9
    static let player: CGFloat = 10
    
    // hud elements should have the highest priorities
    static let hudBackground: CGFloat = 20
    static let hudLabel: CGFloat = 21
    
}

// Relative to parent size
struct AspectScaleMultiplier {

    // Menu Scene

    // Game Scene
    static let playRewardAdsButton: CGFloat = 0.1
    static let cancelButton: CGFloat = 0.1
}

struct GoogleAdmobValues {
    
    static let bannerAdUnitID = ""
    
    static let rewardAdUnitID = ""
    
    static let interstitialAdUnitID = ""
    
}

struct PhysicsCategories {
    static let none: UInt32 = 0
    static let all: UInt32 = UInt32.max
    static let edge: UInt32 = 0x1 << 1
    static let player: UInt32 = 0x1 << 2
    static let block: UInt32 = 0x1 << 3
}


struct RewardAdConstant {
    static let adAvailableWaitTime = 5.0
    static let adNotAvailableWaitTime = 3.0
}

extension SKView {
    
    var sceneBackgroundPosition: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    // Menu Scene
    
    var tapToStartImgPosition: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    var noAdsButtonPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.9, y: bounds.maxY * 0.9)
    }
    
    // Game Scene
    
    var playerPosition: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.maxY * 0.2)
    }
    
    var blockStartingPosition: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.maxY + 100)
    }
    
    var playRewardAdsButtonPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.5)
    }
    
    var cancelButtonPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.4)
    }
    
    var showScoreChangeLabelPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.5)
    }
}
