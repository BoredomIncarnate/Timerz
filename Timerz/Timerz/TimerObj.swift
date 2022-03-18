//
//  TimerObj.swift
//  Timerz
//
//  Created by Kyle Young on 3/17/22.
//

import Foundation
import AVFoundation

extension TimerManager {
    
    struct TimerObj: Identifiable {
        
        var id: Int
        
        var secondsRemaining: Int
        var isPaused: Bool = false
        
        mutating func add(seconds: Int) -> Void {
            secondsRemaining += seconds
        }
        
        mutating func PlayPause() -> Void {
            isPaused.toggle()
        }
        
        mutating func TicDown() -> Void {
            if !isPaused {
                secondsRemaining -= 1
                
                if secondsRemaining < 0 {
                    AudioServicesPlaySystemSound(1106)
                }
            }
        }
    }
    
}
