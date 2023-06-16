# What is a variable in Swift?
A variable is the assignment between a name and a value. It is denoted by the *var* keyword:
```swift
var favoriteSuperhero = "Spider-Man"
```
A variable can be changed, meaning if you reassign it in the future, that is allowed:
```swift
var favoriteSuperhero = "Spider-Man"
favoriteSuperhero = "Batman"
```
# What is a constant in Swift?
A constant, like a variable, is the assignment between a name and a value. It is denoted by the *let* keyword:
```swift
let numberOfFavoriteSuperheroes = 1
```
Unlike variables, constants are immutable, meaning that you cannot reassign the value for one that you declare:
```swift
let numberOfFavoriteSuperheroes = 1
numberOfFavoriteSuperheroes = 2
// THIS WOULD THROW AN ERROR
```