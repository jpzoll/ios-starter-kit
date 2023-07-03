An enumeration of an error, password example:
```swift
enum PasswordError: Error {
	case short, obvious
}
```
We can use this inside of a function that validates a password or not:
```swift
func checkPassword(_ password: String) throws -> String {
	if password.count < 5 { throw PasswordError.short }
	if password == "12345" { throw PasswordError.obvious }

	if password.count < 8 {
		return "OK"
	} else if password.count < 10 {
		return "Good"
	} else {
		return "Excellent"
	}
}
```
We then make this call inside of a **do-catch** block:
```swift
do {
	let passwordCheck = try checkPassword("12345")
	print(passwordCheck)
} catch PasswordError.short {
	print("That shit is too SHORT brah.")
} catch PasswordError.obvious {
	print("That's too obvious. Write a more complex password"")
} catch {
	print("General Password Error: \(error.localizedDescription)")
}
```