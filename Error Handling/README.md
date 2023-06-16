# Example: Making a sandwich
```swift
func makeSandwich() throws {
}

do {
    try makeSandwich()
    print("Yummy! :)")
} catch SandwichError.noDishes {
    doDishes()
} catch SandwichError.noIngredients(let ingredients) {
    getGroceries(ingredients)
}
```