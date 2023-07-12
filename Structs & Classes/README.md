# What is a struct? What is a class?
A struct or class is a means of encapsulating components in your application that represent objects. This is a pillar in **Object-Oriented Programming** known as **Encapsulation**.

## What is the difference between a struct and a class?
![[Pasted image 20230712112454.png]]
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
# Structs Vs. Classes | Distinctions Listed
- I have an instance of a class called variable A. If I create a variable B which is an duplicate of variable A, then A and B both point to the same piece of data. That means if I change the properties (i.e. an attribute) of variable A, then B changes in the same way.
	- This holds even if A is a var and B is a constant
- Classes offer **Inheritance**, which is when a class builds off the functionality of another
	- Think of it as one class "inheriting" the methods and properties of another class
- Classes will NOT generate a memberwise initializer. That means you have 2 options when generating a class
	- Create your own **custom initializer**
	- Have default values for all your attributes
- Classes can have a **deinitializer**
- Even if a class instance is a constant, its variable properties can change

# How do you make a struct mutable?
By default, a struct you create that includes a method inside of it is not mutable by default. The following as a example:
```swift
struct Employee {
    let name: String
    var vacationRemaining: Int

    func takeVacation(days: Int) {
        vacationRemaining -= days
        print("\(vacationRemaining) days of vacation remaining!")
    }
}
```
By default, if you try to call for example:
```swift
var e1 = Employee(name: "Student", vacationRemaining: 14)
e1.takeVacation(days: 2)
```
Swift will complain. This is because structs by default are read-only. The way to get around this is by using the **Mutable** keyword:
```swift
struct Employee {
    let name: String
    var vacationRemaining = 14

    mutating func takeVacation(days: Int) {
        vacationRemaining -= days
        print("\(vacationRemaining) days of vacation remaining!")
    }
}
```
# How is instantiating a Struct like calling a function?
Under the hood, structs have an **init** function, which initializes an instance of a struct with all its data and methods. For the Employee class above, the following can be seen as a function call:
```swift
var e1 = Employee(name: "Student", vacationRemaining: 14)
```
It is the same as saying:
```swift
var e1 = Employee.init(name: "Student", vacationRemaining: 14)
```
Swift being smart enough to do the same thing without the init function explicitly called is syntactical sugar.

# Static Properties & Methods
Within Structs, we can also set attributes and methods that refer to the actual struct itself, not just some instance.
```swift
struct Champion {
    static var name = "Levi Ackerman"
    static var rating = 99
    static var items = [String]()
    
    static func addItem(_ item: String) {
        items.append(item)
    }
}

print(Champion.items)
Champion.addItem("Sword")
// OUTPUT: []
Champion.addItem("ODM Gear")
// OUTPUT: ["Sword", "ODM Gear"]
print(Champion.items)

```
# Access Control Modifiers
The following are the possible access control modifiers one can apply to struct properties and methods
- **private**
- **private(set)**
- **public**
- **privatefile**

**private(set)** allows you to get the property itself, *but you cannot reassign its value*.

# Example Structs
```swift
/*
GLIDER STRUCT
 */

struct Glider {
    let model: String
    let wingSpan: Int
    
    private var gasLvl: Double {
        didSet {
            print("GAS LVL: \(gasLvl)")
        }
    }
    public var cargoOnBoard: [String]
    private var wheelsOut: Bool = false
    
    private(set) var isFlying: Bool {
        willSet {
        }
        didSet {
            if (isFlying != oldValue) {
                if (isFlying == true) {
                    print("Taking off... and we're off! :D")
                    gasLvl -= 30
                } else {
                    print("Landing... landed safely :)")
                    gasLvl -= 20
                }
            }
            else
            {
                if isFlying { print("We're already in the air friend :)") }
                else { print("We're already chilling on the Earth :)")}
            }
        }
    }
    
    init(model: String, wingSpan: Int) {
        // constants are set, but variables have default set lvls upon production
        self.model = model
        self.wingSpan = wingSpan
        
        self.gasLvl = 100
        self.cargoOnBoard = []
        self.wheelsOut = false
        
        self.isFlying = false
        
        
        
    }
    
    mutating func fillGas(amt: Double) {
        if (gasLvl + amt) > 100 {
            gasLvl = 100
        } else {
            gasLvl += amt
        }
    }
    
    mutating func storeCargo(_ newCargo: String) {
        if cargoOnBoard.count == 5 {
            print("Cargo at max capacity (5). Please use other means of storage")
        } else {
            cargoOnBoard.append(newCargo)
        }
    }
    
    mutating func takeOff() { isFlying = true}
    mutating func land() { isFlying = false }
    
}

var nausicaasGlider = Glider(model: "Wind Valley Inc.", wingSpan: 50)

```