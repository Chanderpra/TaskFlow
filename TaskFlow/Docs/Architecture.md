# TaskFlow Architecture

## Layers

Presentation
- Views
- ViewModels

Domain
- Repository Protocols

Data
- SwiftData Repository

Persistence
- SwiftData

## Dependency Flow

View
    ↓
ViewModel
    ↓
TaskRepository (Protocol)
    ↓
SwiftDataTaskRepository
    ↓
ModelContext
