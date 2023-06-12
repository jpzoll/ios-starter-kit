# What is a struct? What is a class?
A struct or class is a means of encapsulating components in your application that represent objects. This is a pillar in **Object-Oriented Programming** known as **Encapsulation**.

## What is the difference between a struct and a class?
A struct is a lightweight **value** type of encapsulation of objects. This means that when you assign a variable to an instance of a struct, that instance stands alone as an individual value. If you create a variable that is assigned to the original instance, that will be a *duplicate* of the original instance. Let's see this example: 
```swift
struct Computer {
	var id: Int
	var manufacturer: String
	var owner: String
}
```
If we we create an instance of this Computer struct, say *c1*, any new variables that reference c1 will not point to the original instance. It will be a duplicate.
```swift
var c1 = Computer(id: 1, manufacturer: "Apple", owner: "JP")
var c2 = c1
c2.manufacturer = "Microsoft"
print(c1.manufacturer)
```
```
// OUTPUT : Apple
```

**But what about classes?**
A class is a **reference** type of encapsulation. This means that any reference to a class instance can be referred to by another variable.
```swift
class Computer {
	var id: Int,
	var manufacturer: String,
	var owner: String

	init(id: Int, manufacturer: String, owner: String) {
		self.id = id
		self.manufacturer = manufacturer
		self.owner = owner
	}
}
```
If we manipulate the second reference to an instance, it will manipulate what the first reference points to, because it is a single value that is being pointed to:
```swift
var c1 = Computer(id: 1, manufacturer: "Apple", owner: "JP")
var c2 = c1
c2.manufacturer = "Microsoft"
print(c1.manufacturer)
```
```
// OUTPUT: Microsoft
```

