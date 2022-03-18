//
//  Controls.swift
//  Timerz
//
//  Created by Kyle Young on 3/17/22.
//

import SwiftUI

extension Views.Timers {
    struct Controls: View {
        
        var addTimer: (Int) -> ()
        
        @State private var timeToAdd = ""
        var body: some View {
            HStack {
                TextField("Seconds", text: $timeToAdd)
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                Text("Add Timer").onTapGesture {
                    print("add timer")
                    if let timeInSeconds = Int(timeToAdd) {
                        addTimer(timeInSeconds)
                    }
                }
            }
            .padding(.all)
        }
    }
}
