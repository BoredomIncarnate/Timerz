//
//  Timer.swift
//  Timerz
//
//  Created by Kyle Young on 3/17/22.
//

import SwiftUI

extension Views {
    struct BasicTimer: View {
        
        var amountOfTime: Int
        var isPaused: Bool
        var deleteFunction: (Int) -> Void
        var playPauseFunction: (Int) -> Void
        var id: Int
        
        var time: some View {
            Text("Time: \(amountOfTime)")
                .font(.largeTitle)
                .padding()
        }
        
        var play: some View {
            Image(systemName: "play.fill")
                .foregroundColor(.blue)
                .onTapGesture {
                    playPauseFunction(id)
                }
        }
        
        var pause: some View {
            Image(systemName: "pause")
                .foregroundColor(.orange)
                .onTapGesture {
                    playPauseFunction(id)
                }
        }
        
        var delete: some View {
            Image(systemName: "trash.fill")
                .foregroundColor(.red)
                .onTapGesture {
                    deleteFunction(id)
                }
        }
        
        var controls: some View {
            HStack {
                if isPaused {
                    play
                } else {
                    pause
                }
                delete.padding(.horizontal)
            }
            .font(.title)
        }
        
        var body: some View {
            HStack {
                time
                Spacer()
                controls
            }
            .padding(.vertical)
        }
    }
}
