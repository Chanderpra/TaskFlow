//
//  TaskListViewModel.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import Foundation
import Observation
import SwiftData

@Observable
final class TaskListViewModel {

    private let repository: TaskRepository

    var tasks: [Task] = []

    init(modelContext: ModelContext) {
            self.repository = SwiftDataTaskRepository(modelContext: modelContext)
        }
    
    func loadTasks() {
        do {
            tasks = try repository.fetchTasks()
        } catch {
            print("Failed to fetch tasks: \(error)")
        }
    }
}
