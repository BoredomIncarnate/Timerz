//
//  List.swift
//  Timerz
//
//  Created by Kyle Young on 3/17/22.
//

import SwiftUI

extension Views.Timers {
    struct Register: View {
        
        var timers: [TimerManager.TimerObj]
        var delete: (Int) -> Void
        var playPause: (Int) -> Void
        
        var body: some View {
            ScrollView {
                ForEach(timers) { timer in
                    Views.BasicTimer(amountOfTime: timer.secondsRemaining,
                              isPaused: timer.isPaused,
                              deleteFunction: delete,
                              playPauseFunction: playPause,
                              id: timer.id)
                }
            }
        }
    }
}
