//
//  ContentView.swift
//  iExpense
//
//  Created by Phil Prater on 9/6/23.
//

import SwiftUI



struct ContentView: View {
    // NOTE: @StateObject only used when CREATING a class instance. Otherwise use @ObservedObject
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Test", amount: 420.69)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    // removal function
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
