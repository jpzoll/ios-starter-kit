Closures are blocks of code whose functionality can be passed around like a function. Closures can have parameters with specific types and have a return value with a specific type.
```swift
// Putting closure as a parameter of another function
let newPeople = people.sorted(by: {(s1: String, s2: String) -> Bool in
    return s2 > s1
})
```

# Shorthand Syntax
In many cases, the full syntax of closures are complicated and hard to read. For this reason, we are able to cut down to a much more shorthand version of closures used in our code
```swift
// Putting closure as a parameter of another function
let newPeople = people.sorted(by: {(s1: String, s2: String) -> Bool in
    return s2 > s1
})
print(newPeople)

let newPeople2 = people.sorted(by: {(s1, s2) -> Bool in
    return s2 > s1
})
print(newPeople2)

let newPeople3 = people.sorted(by: {(s1, s2) in
    return s2 > s1
})

print(newPeople3)

let newPeople4 = people.sorted {
    return $0 < $1
}

print(newPeople4)
```

# Passing multiple closures into a function
```swift
func doCoolStuff(one: () -> Void, two: () -> Void, third: () -> Void) {
    print("Starting work 1...")
    one()
    print("Starting work 2...")
    two()
    print("Starting work 3...")
    third()
}

doCoolStuff() {
    print("W1")
} two: {
    print("W2")
} third: {
    print("W3")
}
```
**Output**:
```
Starting work 1...
W1
Starting work 2...
W2
Starting work 3...
W3
```
