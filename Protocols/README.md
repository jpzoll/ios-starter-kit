# Opaque Return Types
We know that Swift is a strongly typed language, meaning it is very strict about the types you pass in and out of your code.
Because of this, it may sometimes be difficult when trying to compare (I.e. by the equivalent operator = =) different return types of functions, even when they share a common general framework (*cough cough* a protocol!!!).
Because of this, swift offers the use of Opaque Return Types. This is the practice of allowing functions to have a return type of anything that uses a particular protocol without needing to explicitly state the precise return type.

For starters, we know that if we tried this, then Swift would complain, as you cannot compare a Int and a Bool with equivalence:
```swift
func getNumber() -> Int {
    Int.random(1...12)
}

func getBool() -> Bool {
    Bool.random()
}

print(getNumber() == getNumber())
print(getBool() == getBool())
```
However, we *do* know that both Int's Bool's fall under the **Equatable** protocol. For this, you may try adjusting the return type as such for both functions:
```swift
func getNumber() -> Equatable {
    Int.random(1..12)
}

func getBool() -> Equatable {
    Bool.random()
}
```
However, Swift complains even more when trying that. What we must do is add the **some** keyword indicate that we are return ***some type of Equatable*.
```swift
func getNumber() -> some Equatable {
    Int.random(1..12)
}

func getBool() -> some Equatable {
    Bool.random()
}

print(getNumber() == getNumber())
print(getBool() == getBool())
```
**This is valid Swift code!**