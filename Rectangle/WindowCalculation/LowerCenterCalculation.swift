//
//  LowerCenterCalculation.swift
//  Rectangle, Ported from Spectacle
//
//  Created by Ryan Hanson on 6/14/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Foundation

class LowerCenterCalculation: WindowCalculation, RepeatedExecutionsCalculation {

    override func calculateRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {

        if lastAction == nil || !Defaults.subsequentExecutionMode.resizes {
            return calculateFirstRect(window, lastAction: lastAction, visibleFrameOfScreen: visibleFrameOfScreen, action: action)
        }
        
        return calculateRepeatedRect(window, lastAction: lastAction, visibleFrameOfScreen: visibleFrameOfScreen, action: action)
    }
    
    func calculateFirstRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        
        var centerOneQuarterRect = visibleFrameOfScreen
        centerOneQuarterRect.size.width = floor(visibleFrameOfScreen.width / 2.0)
        centerOneQuarterRect.size.height = floor(visibleFrameOfScreen.height / 2.0)
        centerOneQuarterRect.origin.x = visibleFrameOfScreen.minX + floor(visibleFrameOfScreen.width / 4.0)
        return RectResult(centerOneQuarterRect)
    }
    
    func calculateSecondRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        
        var centerTwoThirdsRect = visibleFrameOfScreen
        centerTwoThirdsRect.size.width = floor(visibleFrameOfScreen.width * 2 / 3.0)
        centerTwoThirdsRect.origin.x = visibleFrameOfScreen.minX + floor(visibleFrameOfScreen.width / 6.0)
        centerTwoThirdsRect.size.height = floor(visibleFrameOfScreen.height / 2.0)
        return RectResult(centerTwoThirdsRect)
    }
    
    func calculateThirdRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        
        var centerOneThirdRect = visibleFrameOfScreen
        centerOneThirdRect.size.width = floor(visibleFrameOfScreen.width / 3.0)
       centerOneThirdRect.origin.x = visibleFrameOfScreen.minX + visibleFrameOfScreen.width - (centerOneThirdRect.width * 2)
        centerOneThirdRect.size.height = floor(visibleFrameOfScreen.height / 2.0)
        return RectResult(centerOneThirdRect)
    }
}
