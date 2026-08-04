//
//  TaskListView.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State
    private var viewModel: TaskListViewModel?
    
    var body: some View {
            NavigationStack {
                Text("Tasks")
                    .navigationTitle("Tasks")
            }
            .task {
                if viewModel == nil {
                    let vm = TaskListViewModel(modelContext: modelContext)
                    vm.loadTasks()
                    viewModel = vm
                }
            }
        }
}

#Preview {
    TaskListView()
}
