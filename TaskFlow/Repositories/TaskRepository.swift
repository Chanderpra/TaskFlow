//
//  TaskRepository.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import Foundation

protocol TaskRepository {

    func fetchTasks() throws -> [Task]

    func addTask() throws

    func deleteTask(_ task: Task) throws
}
