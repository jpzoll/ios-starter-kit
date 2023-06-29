# For Loop
This will print the numbers 1 through 10:
```swift
for i in 1...10 {
	 print(i)
}
```
This will print the numbers 1 **up to** 10:
```swift
for i in 1..<10 {
	print(i)
}
```

# While loop
```swift
Int i = 1
while i <= 10 {
	print(i)
	i += 1
}
```

# Exiting nested loops
```swift
// Guessing a movement combination
let options = ["up", "down", "left", "right"]
let myCombo = ["up", "down", "left"]

outerloop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("in loop")
            let attempt = [option1, option2, option3]
            if myCombo == attempt {
                print("\(attempt) is my combo!")
                break outerloop
            }
        }
    }
}

```
