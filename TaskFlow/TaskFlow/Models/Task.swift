//
//  Task.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import Foundation
import SwiftData

@Model
final class Task {

    @Attribute(.unique)
    var id: UUID

    var title: String

    var isCompleted: Bool

    var createdAt: Date

    init(
        title: String,
        isCompleted: Bool = false
    ) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = Date()
    }
}
