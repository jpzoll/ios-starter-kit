UserDefaults is a means of storing small pieces of data across multiple iterations of your application. For example, if you have a piece of text that you would like to save and persist after the user closes and reopens the app, then UserDefaults is a perfect choice for you.
# Example: Storing a String
*Credit To Idently on YouTube: [https://youtu.be/fnHxRvryVMM]*
The following is syntax for storing a string inside of UserDefaults:
```swift
@State var savedText: String = UserDefaults.standard.string(forKey: "MY_DATA") ?? ""
```
Say we have a TextField where we enter some important information that we want to remain on our app:
```swift 
Section(header: Text("INPUT")) {
	TextField("Add some text here.", text: $inputText)
}
```
For this example, we use a button to trigger the saving of our text data to UserDefaults:
```swift
Section(header: Text("ACTIONS:")) {
	Button("Save Data") {
		UserDefaults.standard.set(inputText, forKey: "MY_DATA")
		savedText = inputText
	}
}
```
Say we were to type in "Spider-Man: Across The Spider-Verse" and hit enter. Here is one version of an app that has these functionalities. This is what it looks like AFTER saving, closing, and reopening the app:

![[Pasted image 20230622122013.png]]