# How to separate a string by a character into an array
```swift
let str = "This is Joe Zoll"
```
If we want to separate this into an array containing each letter, meaning we want to separate the string by each space, then we can do the following:
```swift
let components = str.components(separatedBy: " ")
```
# How to see if the word *Crocodile* is spelled correctly
```swift
func checkWord() {
	let str = "Crocodile"
	let checker = UITextChecker()
	
	let range = NSRange(location: 0, length: str.utf16.count)
	
	let result = checker.rangeOfMisspelledWord(in: str, range: range, startingAt: 0, wrap: false, language: "en")
	
	let isCorrect = result.location == NSNotFound
	
	print("isCorrect: \(isCorrect)")
}
```
This should print isCorrect as True!
