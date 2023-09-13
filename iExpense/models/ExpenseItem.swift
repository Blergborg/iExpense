//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Phil Prater on 9/12/23.
//

import Foundation

// Represents a single expense
// Conforms to Identifiable protocol (only requirement is it has an "id" property that is a unique value)
// ( By adding the Identifiable protocol dyanmic Lists that use ForEach don't need to set an id, Swift knows to use this one)
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()  // ask Swift to generate a unique id for expense items. NOTE: update this to var from let to make Codable work.
    let name: String
    let type: String
    let amount: Double
}
