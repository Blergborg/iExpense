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

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
