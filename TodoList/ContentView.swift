//
//  ContentView.swift
//  TodoList
//
//  Created by Kaukab Farrukh on 2024-11-25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var allTasks: [Task]
    
    @State var taskName = ""

    var body: some View {
        NavigationSplitView {
            VStack {
                TextField("Task Name", text: $taskName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: addTask) {
                    Text("Add Task")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                List {
                    ForEach(allTasks) { task in
                        HStack {
                            Text(task.name)
                                .strikethrough(task.isDone, color: .gray)
                            
                            Spacer()
                            
                            Text(task.isDone ? "Done" : "Pending")
                                .foregroundColor(task.isDone ? .green : .red)
                        }
                        .onTapGesture {
                            toggleTaskStatus(task)
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        } detail: {
            Text("Select a task")
        }
    }

    private func addTask() {
        withAnimation {
            guard !taskName.isEmpty else { return }
            let newTask = Task(name: taskName, isDone: false)
            modelContext.insert(newTask)
            taskName = ""
        }
    }

    private func toggleTaskStatus(_ task: Task) {
        withAnimation {
            task.isDone.toggle()
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(allTasks[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
