//
//  ContentView.swift
//  Timerz
//
//  Created by Kyle Young on 3/13/22.
//

import SwiftUI

struct Timers: View {
    var body: some View {
        VStack {
            Timers_Controls()
                .padding(.vertical)
                .font(.title)
            Timers_Body()
            Spacer()
        }
    }
}

struct Timers_Controls: View {
    @State private var timeToAdd = ""
    @State private var showAlert: Bool = false
    var body: some View {
        HStack {
            TextField("Seconds", text: $timeToAdd)
                .padding(.horizontal)
            Button("Add Timer") {
                showAlert = true
            }
                .alert("Important message", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding(.all)
    }
}

struct Timers_Body: View {
    let timers: [Int] = [20,30,50, 60]
    var body: some View {
        ForEach(timers, id: \.self) { timer in
            Timer(amountOfTime: timer)
        }
    }
}

struct Timer: View {
    
    var amountOfTime: Int = 30
    
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
    var body: some View {
        Timers()
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
