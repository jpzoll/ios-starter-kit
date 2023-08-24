# How to separate a string by a character into an array
```swift
let str = "This is Joe Zoll"
```
If we want to separate this into an array containing each letter, meaning we want to separate the string by each space, then we can do the following:
```swift
let components = str.components(separatedBy: " ")
```
