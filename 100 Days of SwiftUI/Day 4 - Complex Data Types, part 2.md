# Type Inference
Swift uses ************Type Inference************ in order to assign a type to the variables or constants that you assign.

```swift
let name = "Joe"
```

This constant will be inferred as a String.

```swift
var age = 23
```

This variable will be inferred as an Int
# Type Annotations
Using **Type Annotations** in Swift makes our variable types explicit instead of implicit.
```swift
var n1: Double = 100_000_000
var n2 = 100_000_000
```
In the code above, the **Double** is a type annotation, which casts n1 as a double. While the value 100_000_00 may be an Int, the annotation there makes it a double. Its value now is 100_000_000.0.
```swift
print(type(of:n1))
print(type((of:n2)))

// Double
// Int
```