//
//  TaskFlowTests.swift
//  TaskFlowTests
//
//  Created by vsmart on 03/08/26.
//

import XCTest
@testable import TaskFlow

import XCTest
@testable import TaskFlow

final class TaskFlowTests: XCTestCase {

    func testTaskCreation() {
        let task = TaskItem.init(title: "Learn SwiftUI", category: "Learning", completed: false, date: "Today")

        XCTAssertEqual(task.title, "Learn CI/CD")
        XCTAssertFalse(task.completed)
    }
}
