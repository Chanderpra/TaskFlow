//
//  DummyTasks.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import Foundation

struct DummyTasks {

    static let tasks: [TaskItem] = [
        .init(title: "Learn SwiftUI", category: "Learning", completed: false, date: "Today"),
        .init(title: "Implement Login Screen", category: "Development", completed: true, date: "Yesterday"),
        .init(title: "Push Code to GitHub", category: "CI/CD", completed: false, date: "Today"),
        .init(title: "Setup GitHub Actions", category: "DevOps", completed: false, date: "Tomorrow"),
        .init(title: "Deploy with Xcode Cloud", category: "Release", completed: false, date: "Friday")
    ]
}
