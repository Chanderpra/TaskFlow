//
//  TaskFlowApp.swift
//  TaskFlow
//
//  Created by vsmart on 03/08/26.
//

import SwiftUI
import SwiftData

@main
struct TaskFlowApp: App {
    var body: some Scene {
           WindowGroup {
               HomeView()
           }
           .modelContainer(for: [Task.self])
       }
}
