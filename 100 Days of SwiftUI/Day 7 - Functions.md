- **Function Call Site**: The invocation of a defined function (with passed arguments if parameters were created in the function definition)
```swift
func add(a: Int, b: Int) {
	return a + b
}

// This line is the **CALL SITE** 
add(a: 2, b: 3)
```

# Returning Values
In Swift, we have the option of returning multiple values from our functions. You can do this by returning an array or dict. However, there is also the option of using **tuples**, which are clearly defined sets that contain specific values. These are different from dictionaries in that we know exactly what will be contained inside of them.

# Parameter Labeling
Swift allows us to customize our external parameters names (meaning the parameter names when we call our function) in 2 key ways.
### Removing external parameter
```swift
func isUppercase(_ string: String) -> Bool {
	string == string.uppercased()
}

let result = isUppercase("HELLO, WORLD")
```

### Replacing external parameter with keyword *for*
```swift
func printTimesTable(for number: Int) {
	for i in 1...12 {
		print("\(i) X \(number) = \(i * number)")
	}
}

printTimesTable(for: 5)
```