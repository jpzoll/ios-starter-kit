```swift
struct ContentView: View {
    @State var name = ""
    var body: some View {
        Form {
            TextField("Name", text: $name)
            Text("Hello \(name)!")
        }
    }
}```
Notice how we use the dollar sign ($) in order to tell Swift that, in the TextField, we are *simultaneously* writing to memory the change of **name**'s value and reading it as the user changes it (types a different name in the TextField).