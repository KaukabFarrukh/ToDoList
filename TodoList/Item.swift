//
//  Item.swift
//  TodoList
//
//  Created by Kaukab Farrukh on 2024-11-25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
