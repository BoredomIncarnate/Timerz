//
//  ViewModel.swift
//  Timerz
//
//  Created by Kyle Young on 3/15/22.
//

import Foundation

class ViewModel: ObservableObject {

    init() {
        addTimer(timeInSeconds: 30)
    }
    
    //MARK: - Time Keeping
    @Published private(set) var timeManager = TimerManager()
    
    var timers: [TimerManager.TimerObj] {
        timeManager.timers
    }
    
    func ticDown() {
        objectWillChange.send()
        timeManager.TicDown()
    }
    
    //MARK: - Intents
    func addTimer(timeInSeconds: Int) {
        objectWillChange.send()
        timeManager.addTimer(timeInSeconds: timeInSeconds)
    }
    
    func playPauseTimer(timerId: Int) {
        objectWillChange.send()
        timeManager.playPauseTimer(timerId: timerId)
    }
    
    func deleteTimer(timerId: Int) {
        objectWillChange.send()
        timeManager.deleteTimer(timerId: timerId)
    }
}
