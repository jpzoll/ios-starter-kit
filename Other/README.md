# Using a definite value in a parameter with optional type
I learned how to unwrap an optional type. If a function passes a String? and you try to invoke the method passing a definite string, then you must use either a coalesce operator ?? or force unwrap the string using !
**Furthermore, this example shows how to destroy an instance of an object by using an optional type of struct (in this case it is Enemy struct)**
```swift
var en1: Enemy?
en1 = Enemy("Swordsman")

Nausicaa.attack(en1 ?? Enemy("Swordsman"))
en1 = nil
```