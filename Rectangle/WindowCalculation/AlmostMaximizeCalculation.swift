//
//  AlmostMaximizeCalculation.swift
//  Rectangle
//
//  Created by Ryan Hanson on 7/26/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Foundation

class AlmostMaximizeCalculation: WindowCalculation, RepeatedExecutionsCalculation {
    
    let almostMaximizeHeight: CGFloat
    let almostMaximizeWidth: CGFloat

    override init() {
        let defaultHeight = Defaults.almostMaximizeHeight.value
        almostMaximizeHeight = (defaultHeight <= 0 || defaultHeight > 1)
            ? 0.9
            : CGFloat(defaultHeight)

        let defaultWidth = Defaults.almostMaximizeWidth.value
        almostMaximizeWidth = (defaultWidth <= 0 || defaultWidth > 1)
            ? 0.9
            : CGFloat(defaultWidth)
    }
    
    override func calculateRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {

        if lastAction == nil || !Defaults.subsequentExecutionMode.resizes {
            return calculateFirstRect(window, lastAction: lastAction, visibleFrameOfScreen: visibleFrameOfScreen, action: action)
        }
        
        return calculateRepeatedRect(window, lastAction: lastAction, visibleFrameOfScreen: visibleFrameOfScreen, action: action)
    }
    
    func calculateFirstRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        var calculatedWindowRect = visibleFrameOfScreen
        
        // Resize
        calculatedWindowRect.size.height = round(visibleFrameOfScreen.height * almostMaximizeHeight)
        calculatedWindowRect.size.width = round(visibleFrameOfScreen.width * almostMaximizeWidth)
        
        // Center
        calculatedWindowRect.origin.x = round((visibleFrameOfScreen.width - calculatedWindowRect.width) / 2.0) + visibleFrameOfScreen.minX
        calculatedWindowRect.origin.y = round((visibleFrameOfScreen.height - calculatedWindowRect.height) / 2.0) + visibleFrameOfScreen.minY
        
        return RectResult(calculatedWindowRect)
    }
    
    func calculateSecondRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        var calculatedWindowRect = visibleFrameOfScreen
        
        // Resize
        calculatedWindowRect.size.height = round(visibleFrameOfScreen.height * 0.6)
        calculatedWindowRect.size.width = round(visibleFrameOfScreen.width * 0.6)
        
        // Center
        calculatedWindowRect.origin.x = round((visibleFrameOfScreen.width - calculatedWindowRect.width) / 2.0) + visibleFrameOfScreen.minX
//        calculatedWindowRect.origin.y = round((visibleFrameOfScreen.height - calculatedWindowRect.height) / 2.0) + visibleFrameOfScreen.minY
        
        return RectResult(calculatedWindowRect)
    }
    
    func calculateThirdRect(_ window: Window, lastAction: RectangleAction?, visibleFrameOfScreen: CGRect, action: WindowAction) -> RectResult {
        var calculatedWindowRect = visibleFrameOfScreen
        
        // Resize
        calculatedWindowRect.size.height = round(visibleFrameOfScreen.height * 0.6)
        calculatedWindowRect.size.width = round(visibleFrameOfScreen.width * 0.6)
        
        // Center
        calculatedWindowRect.origin.x = round((visibleFrameOfScreen.width - calculatedWindowRect.width) / 2.0) + visibleFrameOfScreen.minX
        calculatedWindowRect.origin.y = round((visibleFrameOfScreen.height - calculatedWindowRect.height) / 2.0) + visibleFrameOfScreen.minY
        
        return RectResult(calculatedWindowRect)
    }
}

