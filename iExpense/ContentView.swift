//
//  ContentView.swift
//  iExpense
//
//  Created by Phil Prater on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    // NOTE: even simpler, UserDefaults provides this @AppStorage wrapper we can use instead of @State
    // Great for simple use cases like this.
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
