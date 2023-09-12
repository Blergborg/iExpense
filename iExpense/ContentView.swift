//
//  ContentView.swift
//  iExpense
//
//  Created by Phil Prater on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    
    // How to set state to load from the UserDefaults (SharedPrefs)
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            // NOTE: this is how to use the SharedPrefs equivalent.
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
