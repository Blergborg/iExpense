//
//  ContentView.swift
//  iExpense
//
//  Created by Phil Prater on 9/6/23.
//

import SwiftUI

// NOTE: Swift will actually generate code for archiving and unarchiving more
// complex data instances using the Coadable protocol.
// However, we need to tell Swift *when* to do either of these actions
struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        Button("Save User") {
            // This is how we tell Swift to encode our codable data types.
            // *(Decoding raw data (like JSON) into Codable types is done just by making an instance of the apropriate Decoder())
            // **(Other formats besides JSON are available, but it is a very common choice)
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
