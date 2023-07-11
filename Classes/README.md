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