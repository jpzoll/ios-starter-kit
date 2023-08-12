```swift
struct ContentView: View {
    @State private var numPeople = 1
    
    var body: some View {
        Button("Add Person") {
            numPeople += 1
        }
        Button("Remove Person") {
            numPeople -= 1
        }
        Text("^[\(numPeople) person](inflect: true)")    
    }```
This will change from "person" to "people" based on if there is either 1 person or 2 or more people
```swift
Text("^[\(numPeople) person](inflect: true)")
```