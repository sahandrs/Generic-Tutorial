//
//  SwiftyTabBarTransition.swift
//  SwiftyTabBarTransition
//
//  Created by shndrs on 5/25/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public struct SwiftyTabBarTransition {
    
    ///A Factory method That returns a UIViewControllerAnimatedTransitioning
    
    @discardableResult
    public static func set(transition:SwiftyTabBarTransitionOptions)
        -> UIViewControllerAnimatedTransitioning {
        
        switch transition.animationOption {
            
        case .leftToRight:
            return LeftRight(transition: transition, isItLTR: true)
        case .rightToLeft:
            return LeftRight(transition: transition, isItLTR: false)
        case .fade:
            return Fade(transition: transition)
        case .scaleX:
            return ScaleX(transition: transition)
        case .scaleY:
            return ScaleY(transition: transition)
        default:
            return a(transition: transition)
        }
    }
    
    private static func a(transition: SwiftyTabBarTransitionOptions) -> UIViewControllerAnimatedTransitioning {
        switch transition.animationOption {
            
        case .scaleInXY:
            return ScaleInOutXY(transition: transition, isItIn: true)
        case .scaleOutXY:
            return ScaleInOutXY(transition: transition, isItIn: false)
        case .topToBottom:
            return TopBottom(transition: transition, isItTTB: true)
        case .bottomToTop:
            return TopBottom(transition: transition, isItTTB: false)
        case .topLeftToBottomRight:
            return TopLeftToBottomRight(transition: transition)
        case .bottomLeftToTopRight:
            return BottomLeftToTopRight(transition: transition)
        default:
            return LeftRight(transition: transition, isItLTR: true)
        }
    }
}
