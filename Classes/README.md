# Classes - Inheritance
**Note: I use the following term interchangably:**
- Parent Class = Base Class = = Super Class
- Child Class = Sub Class

Here is an example of inheritance in Swift
```swift
class Employee {
	var name: String
	var position: String

	func doWork() {
		print("I did some work today!")
	}
}

class Manager: Employee {
	
}

let e1 = Employee(name: "Joe", position: "Senior iOS Developer")
let e2 = Manager(name: "Bob", position: "CEO")

e1.doWork()
e2.doWork()

/* 
OUTPUT

I did some work today!
I did some work today!

*/
```
### Polymorphism
If we implement the same method in two subclasses, Swift will be sure to invoke the correct one. This will work either if both methods **override** the parent class method or if it is a new method across all or some child classes.
```swift
class Manager: Employee {
    override func doWork() {
        print("Managed some peeps!")
    }
}

class Janitor: Employee {
    override func doWork() {
        print("*sweeps floor*")
    }
}
let e2 = Manager(name: "Bob", position: "CEO")
let e3 = Janitor(name: "John", position: "Janitor")

e2.doWork()
e3.doWork()

/*
OUTPUT

Managed some peeps!
*sweeps floor*

*/
```
## Overriding a Parent's initializer
Say we have the following base class:
```swift
class Animal {
    let numLegs: Int
    init(numLegs: Int) {
        self.numLegs = numLegs
    }
}```
If we create say a Cat class that is a subclass of Animal (that has a new property), we can either create a new initializer OR override the Animal class' initializer. If we want to do the former, then we pass our new property as an argument and then call **super** to get the Animal class's init for the old properties:
```swift
class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(numLegs: 4)
    }
}```
If we want to do the former, then we must pass in the SAME arguments as the base class' initializer:
```swift
class Cat: Animal {
    let isTame: Bool
    
    override init(numLegs: Int) {
    // **WE CANNOT PASS IN isTame as an argument or Swift will complain!**
        self.isTame = true
        super.init(numLegs: 4)
    }
}```

# Automatic Reference Counting (ARC)
**Automatic Reference Counting** refers to Swifts internal counting of the number of instances for a class. When we create a new object instance the count goes up by 1. When we delete an instance we go down by 1. When the count reaches 0, that means there are no more instances and we call a deinitalizer.

