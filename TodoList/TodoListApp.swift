//
//  TodoListApp.swift
//  TodoList
//
//  Created by Kaukab Farrukh on 2024-11-25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Task.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
