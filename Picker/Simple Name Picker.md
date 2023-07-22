```swift
struct ContentView: View {
    @State private var names = ["Eren", "Mikasa", "Armin"]
    @State private var chosenName = "Eren"
    var body: some View {
        Form {
            Picker("Pick an AoT Character", selection: $chosenName) {
                ForEach(names, id: \.self) { name in
                    Text("\(name)")
                }
            }
        }
    }
}
```