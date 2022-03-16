//
//  TimerManager.swift
//  Timerz
//
//  Created by Kyle Young on 3/15/22.
//

import Foundation

class TimerManager: ObservableObject {
    
    var idCounter: Int = 0
    
    struct TimerObj: Identifiable {
        var id: Int
        
        var secondsRemaining: Int
        var isPaused: Bool = false
        
        mutating func add(seconds: Int) -> Void {
            secondsRemaining += seconds
        }
        
        mutating func Pause() -> Void {
            isPaused = true
        }
        
        mutating func TicDown() -> Void {
            secondsRemaining -= 1
        }
    }
    
    @Published private(set) var timers: [TimerObj] = []
    
    func addTimer(timeInSeconds: Int) -> Void {
        let newTimer = TimerObj(id: idCounter, secondsRemaining: timeInSeconds)
        timers.append(newTimer)
        idCounter += 1
        print("Timer Manger added timer \(newTimer)")
    }
    
    func deleteTimer(timerId: Int) -> Void {
        if let timerToDelete = timers.firstIndex(where: { $0.id == timerId }) {
            print("Deleting Timer => \(timerToDelete)")
            timers.remove(at: timerToDelete)
        }
        
    }
    
    @objc func TicDown() -> Void {
        for index in 0..<timers.count {
            timers[index].TicDown()
            print(timers[index])
        }
    }
    
}
