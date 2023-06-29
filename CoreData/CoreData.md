# How to access a Core Data managed object context from a SwiftUI view
```swift
@Environment(\.managedObjectContext) private var context
@FetchResult(
sortDescriptor: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
animation: .default
)
private var items: FetchedResults<TaskItem>
```