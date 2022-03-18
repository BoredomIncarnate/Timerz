//
//  TimersView.swift
//  Timerz
//
//  Created by Kyle Young on 3/17/22.
//

import SwiftUI

extension Views {
    struct Timers: View {
        
        @ObservedObject var viewModel: ViewModel
        @State private var timer = Timer.publish(every: 1, on: .main, in:.common).autoconnect()
        var body: some View {
            VStack {
                let _ = print("\(viewModel.timers)")
                Controls(addTimer: viewModel.addTimer)
                    .padding(.vertical)
                    .font(.title)
                Register(timers: viewModel.timers, delete: viewModel.deleteTimer, playPause: viewModel.playPauseTimer)
                Spacer()
            }
            .onReceive(timer) { time in
                viewModel.ticDown()
            }
        }
    }
}
