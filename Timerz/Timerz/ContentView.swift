//
//  ContentView.swift
//  Timerz
//
//  Created by Kyle Young on 3/13/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        Views.Timers(viewModel: viewModel)
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
