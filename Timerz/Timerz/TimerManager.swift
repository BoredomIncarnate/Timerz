//
//  TimerManager.swift
//  Timerz
//
//  Created by Kyle Young on 3/15/22.
//

import Foundation

class TimerManager {
    
    struct Timer {
        var secondsRemaining: Int
        var isPaused: Bool = false
        
        mutating func add(seconds: Int) {
            secondsRemaining += seconds
        }
        
        mutating func Pause() {
            isPaused = true
        }
        
        mutating func TicDown() {
            secondsRemaining -= 1
        }
    }
    
    var timers: [Timer] = []
    
    func addTimer(timeInSeconds: Int) {
        let newTimer = Timer(secondsRemaining: timeInSeconds)
        timers.append(newTimer)
    }
    
}
