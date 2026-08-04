//
//  HomeView.swift
//  TaskFlow
//
//  Created by vsmart on 04/08/26.
//

import SwiftUI

struct HomeView: View {

    @State private var searchText = ""
    @State private var tasks = DummyTasks.tasks

    private var filteredTasks: [TaskItem] {
        if searchText.isEmpty {
            return tasks
        }

        return tasks.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.category.localizedCaseInsensitiveContains(searchText)
        }
    }

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    private var pendingCount: Int {
        tasks.filter { !$0.completed }.count
    }

    var body: some View {

        NavigationStack {

            Group {

                if filteredTasks.isEmpty {
                    emptyView
                } else {
                    taskList
                }

            }
            .navigationTitle("TaskFlow")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {

                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd MMM HH:mm"

                        let task = TaskItem(
                            title: "Task \(formatter.string(from: Date()))",
                            category: "General",
                            completed: false,
                            date: "Now"
                        )

                        tasks.insert(task, at: 0)

                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .searchable(text: $searchText,
                        prompt: "Search Tasks")
            .refreshable {

                print("Refresh")
                
                
//                try? await Task.sleep(for: .seconds(1))

            }

        }

    }

}

// MARK: - Task List

private extension HomeView {

    var taskList: some View {

        List {

            statsSection

            Section("Tasks") {

                ForEach(filteredTasks) { task in

                    TaskRow(task: task)

                        .swipeActions(edge: .trailing) {

                            Button(role: .destructive) {

                                if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                    tasks.remove(at: index)
                                }

                            } label: {
                                Label("Delete",
                                      systemImage: "trash")
                            }

                        }

                        .swipeActions(edge: .leading) {

                            Button {

                            } label: {
                                Label("Edit",
                                      systemImage: "pencil")
                            }
                            .tint(.blue)

                        }

                }

            }

        }
        .listStyle(.insetGrouped)

    }

}

// MARK: - Stats

private extension HomeView {

    var statsSection: some View {

        Section {

            ScrollView(.horizontal,
                       showsIndicators: false) {

                HStack(spacing: 16) {

                    StatsCard(
                        title: "Total",
                        value: "\(tasks.count)",
                        color: .blue,
                        icon: "list.bullet.rectangle"
                    )

                    StatsCard(
                        title: "Completed",
                        value: "\(completedCount)",
                        color: .green,
                        icon: "checkmark.circle.fill"
                    )

                    StatsCard(
                        title: "Pending",
                        value: "\(pendingCount)",
                        color: .orange,
                        icon: "clock.fill"
                    )

                }
                .padding(.vertical, 8)

            }

        }

    }

}

// MARK: - Empty View

private extension HomeView {

    var emptyView: some View {

        ContentUnavailableView(
            "No Tasks",
            systemImage: "tray",
            description: Text("Tap + to create your first task.")
        )

    }

}

// MARK: - Task Row

struct TaskRow: View {

    let task: TaskItem

    var body: some View {

        HStack(spacing: 16) {

            Image(systemName: task.completed
                  ? "checkmark.circle.fill"
                  : "circle")
            .font(.title2)
            .foregroundStyle(task.completed ? .green : .gray)

            VStack(alignment: .leading,
                   spacing: 6) {

                Text(task.title)
                    .font(.headline)

                HStack {

                    Label(task.category,
                          systemImage: "folder.fill")
                        .font(.caption)

                    Spacer()

                    Text(task.date)
                        .font(.caption)
                        .foregroundStyle(.secondary)

                }

            }

        }
        .padding(.vertical, 6)

    }

}

// MARK: - Stats Card

struct StatsCard: View {

    let title: String
    let value: String
    let color: Color
    let icon: String

    var body: some View {

        VStack(alignment: .leading,
               spacing: 16) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)

            Text(value)
                .font(.largeTitle.bold())

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

        }
        .frame(width: 150,
               height: 120,
               alignment: .leading)
        .padding()
        .background(color.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 18))

    }

}

// MARK: - Preview

#Preview {
    HomeView()
}
