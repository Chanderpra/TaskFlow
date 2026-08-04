//
//  SwiftDataTaskRepository.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//
import Foundation
import SwiftData

final class SwiftDataTaskRepository: TaskRepository {

    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchTasks() throws -> [Task] {
        let descriptor = FetchDescriptor<Task>()
        return try modelContext.fetch(descriptor)
    }

    func addTask() throws {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm:ss"

        let title = "Task - \(formatter.string(from: Date()))"

        let task = Task(title: title)

        modelContext.insert(task)

        try modelContext.save()
    }

    func deleteTask(_ task: Task) throws {
        fatalError("Not implemented yet")
    }
}
