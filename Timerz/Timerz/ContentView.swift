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
            Timers_Body()
        }
    }
}

struct Timers_Controls: View {
    @State private var timeToAdd = Date()
    @State private var showAlert: Bool = false
    var body: some View {
        HStack {
            DatePicker("", selection: $timeToAdd, displayedComponents: .hourAndMinute)
                .labelsHidden()
            Button("Add Timer") {
                showAlert = true
            }
                .alert("Important message", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

struct Timers_Body: View {
    var body: some View {
        VStack {
            Timer()
            Timer()
            Timer()
            Timer()
        }
    }
}

struct Timer: View {
    var body: some View {
        VStack {
            Timer_Time()
            Timer_Controls()
        }
    }
}

struct Timer_Time: View {
    var body: some View {
        Text("Time: 30")
    }
}

struct Timer_Controls: View {
    var body: some View {
        Text("Start | Stop | Delete")
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
    }
}
