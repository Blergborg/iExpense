//
//  ContentView.swift
//  iExpense
//
//  Created by Phil Prater on 9/6/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        // Wrapping the List's VStack in a NavigationView allows us to add an edit button to VStack through a .toolbar modifier that contains the EditButton(). Serriously, that's it.
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    // onDelete modifier can only be added to a ForEach View (why we're not using the List shorthand).
                    .onDelete(perform: removeRows)
                }
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
            /*
             Button("Show Sheet") {
             showingSheet.toggle()
             }
             .sheet(isPresented: $showingSheet) {
             SecondView(name: "Lil Shitter")
             }
             */
            /*
             VStack {
             Text("Your name is \(user.firstName) \(user.lastName).")
             
             TextField("First name", text: $user.firstName)
             TextField("Last name", text: $user.lastName)
             }
             .padding()
             */
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecondView: View {
    // how to dismiss a View
    @Environment(\.dismiss) var dismiss
    var name: String
    var body: some View {
//        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}
