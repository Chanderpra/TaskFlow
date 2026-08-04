//
//  TaskItem.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import Foundation

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let completed: Bool
    let date: String
}
