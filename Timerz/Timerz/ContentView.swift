//
//  ContentView.swift
//  Timerz
//
//  Created by Kyle Young on 3/13/22.
//

import SwiftUI

struct Timers: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            let _ = print("\(viewModel.timers)")
            Timers_Controls(addTimer: viewModel.addTimer)
                .padding(.vertical)
                .font(.title)
            Timers_Body(timers: viewModel.timers, delete: viewModel.deleteTimer)
            Spacer()
        }
    }
}

struct Timers_Controls: View {
    
    var addTimer: (Int) -> ()
    
    @State private var timeToAdd = ""
    var body: some View {
        HStack {
            TextField("Seconds", text: $timeToAdd)
                .padding(.horizontal)
            Text("Add Timer").onTapGesture {
                print("add timer")
                addTimer(30)
            }
        }
        .padding(.all)
    }
}

struct Timers_Body: View {
    
    var timers: [TimerManager.TimerObj]
    var delete: (Int) -> Void
    
    var body: some View {
        ForEach(timers) { timer in
            TimerView(amountOfTime: timer.secondsRemaining, deleteFunction: delete, id: timer.id)
        }
    }
}

struct TimerView: View {
    
    var amountOfTime: Int
    var deleteFunction: (Int) -> Void
    var id: Int
    
    var time: some View {
        Text("Time: \(amountOfTime)")
            .font(.largeTitle)
            .padding()
    }
    
    var controls_play: some View {
        Image(systemName: "play.fill")
            .foregroundColor(.blue)
    }
    
    var controls_pause: some View {
        Image(systemName: "pause")
            .foregroundColor(.orange)
    }
    
    var controls_delete: some View {
        Image(systemName: "trash.fill")
            .foregroundColor(.red)
            .onTapGesture {
                deleteFunction(id)
            }
    }
    
    var controls: some View {
        HStack {
            controls_play
            controls_pause.padding(.horizontal)
            controls_delete
        }
        .font(.title)
    }
    
    var body: some View {
        VStack {
            time.padding(.bottom)
            controls
        }
        .padding(.vertical)
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        let _ = print("Content View loaded")
        let _ = print("timers: \(viewModel.timers)")
        Timers(viewModel: viewModel)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        Group {
            ContentView()
        }
    }
}
