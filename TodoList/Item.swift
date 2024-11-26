//
//  Item.swift
//  TodoList
//
//  Created by Kaukab Farrukh on 2024-11-25.
//

import Foundation
import SwiftData

@Model
final class Task {
    
    var id: UUID
    var name: String
    var isDone: Bool
    
    
    init(name: String, isDone: Bool = false) {
        self.id = UUID()
        self.name = name
        self.isDone = isDone
    }
}

@Model
final class ShopThing {
    
    var name: String
    var amount: Int
    var bought: Bool
    
    
    init(name: String, amount: Int, bought: Bool = false) {
        self.name = name
        self.amount = amount
        self.bought = bought
    }
}
