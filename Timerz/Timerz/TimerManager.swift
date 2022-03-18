//
//  TimerManager.swift
//  Timerz
//
//  Created by Kyle Young on 3/15/22.
//

import Foundation

class TimerManager: ObservableObject {
    
    var idCounter: Int = 0
    
    @Published private(set) var timers: [TimerObj] = []
    
    func addTimer(timeInSeconds: Int) -> Void {
        
        if timeInSeconds <= 0 {
            return
        }
        
        let newTimer = TimerObj(id: idCounter, secondsRemaining: timeInSeconds)
        timers.append(newTimer)
        idCounter += 1
    }
    
    func playPauseTimer(timerId: Int) -> Void {
        if let timerToToggle = timers.firstIndex(where: { $0.id == timerId }) {
            timers[timerToToggle].PlayPause()
        }
        
    }
    
    func deleteTimer(timerId: Int) -> Void {
        if let timerToDelete = timers.firstIndex(where: { $0.id == timerId }) {
            timers.remove(at: timerToDelete)
        }
        
    }
    
    func TicDown() -> Void {
        for index in 0..<timers.count {
            timers[index].TicDown()
        }
    }
    
}
