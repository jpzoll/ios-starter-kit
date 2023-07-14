class Employee {
    var name: String
    var position: String
    
    init(name: String, position: String) {
        self.name = name
        self.position = position
    }

    func doWork() {
        print("I did some work today!")
    }
}

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

let e1 = Employee(name: "Joe", position: "Senior iOS Developer")
let e2 = Manager(name: "Bob", position: "CEO")
let e3 = Janitor(name: "John", position: "Janitor")

e2.doWork()
e3.doWork()


// Perform inheritance with custom init for sub class

class Animal {
    var type: String = "Fish"
    
    init(type: String) {
        self.type = type
    }
    
    func eat() {
        print("munch munch :p")
    }
}

class SeaCreature: Animal {
    var numGills: Int
    
    init(type: String, numGills: Int) {
        self.numGills = numGills
        super.init(type: type)
        super.eat()
    }
}

/*
 My Questions:
 
 - How does this change with default values given?
 
 */
let a1 = SeaCreature(type: "Shark", numGills: 3)



/*
 Create a video game scenario that uses a deinit
 */
print("\n---------------------------------------------------------------")
struct Nausicaa {
    static var name = "Nausicaa"
    static var age = 18
    
    static func attack(_ enemy: Enemy) {
        print("Attacking \(enemy.type)!")
    }
}

class Enemy {
    var type = "Swordsman"
    
    init(_ type: String) {
        self.type = type
    }
    
    deinit {
        print("\(type) perished!")
    }
}

var enemies: [Enemy?] = [
    Enemy("Swordsman"), Enemy("Swordsman"), Enemy("Goblin")
]
var en1: Enemy?
en1 = Enemy("Swordsman")

Nausicaa.attack(en1 ?? Enemy("Swordsman"))
en1 = nil


// Changing the reference itself

var o1 = Enemy("e1")
print(o1.type)
o1.type = "ooooooo"
print(o1.type)
o1 = Enemy("Goblin")
print(o1.type)

