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
    
    // hud elements should have the highest priorities
    static let hudBackground: CGFloat = 10
    static let hudLabel: CGFloat = 11
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
    
    var playerIconPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.9)
    }
    
    var lazerPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.5, y: bounds.maxY * 0.9)
    }
    
    var batteryIconPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.9, y: bounds.maxY * 0.925)
    }
    
    var garbageIconPosition: CGPoint {
        return CGPoint(x: bounds.maxX * 0.9, y: bounds.maxY * 0.85)
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
