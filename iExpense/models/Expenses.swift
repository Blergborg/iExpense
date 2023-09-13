//
//  Expenses.swift
//  iExpense
//
//  Created by Phil Prater on 9/12/23.
//

import Foundation

// Stores a collection of ExpenseItems
// Conforms to ObservableObject protocol and marks the collection w/ @Published
// so change annoucements get sent whenever any collection items are modified.

/*
 We’re going to leverage four important technologies to help us save and load data in a clean way:

     X The Codable protocol, which will allow us to archive all the existing *expense items* ready to be stored.
     X UserDefaults, which will let us save and load that archived data.
     X A custom initializer for the *Expenses class*, so that when we make an instance of it we load any saved data from UserDefaults
     X A didSet property observer on the *items property of Expenses*, so that whenever an item gets added or removed we’ll write out changes.

 */

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        // Save changes to data.
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // try to load data when app first needs it.
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // if items were loaded, decode them
            // NOTE: To avoid confusion – to say that we mean we’re referring to the type [ExpenseItem] itself,
            // known as the type object – we write .self after it.
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // if items were decoded properly, use them
                items = decodedItems
                return
            }
        }
        
        // set items to empty if no data.
        items = []
    }
}
