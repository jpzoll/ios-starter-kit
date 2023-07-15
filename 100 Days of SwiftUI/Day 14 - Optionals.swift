import Foundation

// What is 'shadowing'?
// What is 'Unwrapping'? How do you do it?
// What is the relationship between optionals and non-optionals?


var x: String? = nil
var dict = [
    "key1": 1,
    "key2": 34,
    "key3": 67
]

//if let x = x {
//    print("x is living and breathing!")
//} else {
//    print("no x")
//}

var keyChoice = "key4"
//if let value = dict[keyChoice] {
//    print("\(keyChoice) is in there AT: \(value)")
//} else {
//    print("\(keyChoice) = nil :(")
//}


// You cannot pass optionals into functions that require optionals of the
// same data type. YES, that means if a function passes a String
// as one argument, you CANNOT pass a String? type
// Think about it, if that function concats to the string passed in,
// then there is no way to apply that to nil



// Explain Guard
// Write example
// When will you use guard vs. if let?

// NIL COALESCING
// 6  name all the possible means of handling optional types in swift
// 1 index a dict with a default value
// 2 convert a string to an int
// 3 q-> What is the difference between nil coalescing and ternary operator?
// 4 i have a list of names. I want to assign 'chosen' as a random name from the list and then make it uppercase. If the value is nil, assign it as "No one". Print the result
// 5 i have a book struct with a name and in some cases an author. if i create a var that may or may not hold a book, i want to handle the case for when there is. Get the book, its author, and the first letter of the authors name uppercased. if there is no author, return "A"
// 7 give an example of handling a function exception with nil coalescing
// 8 what are the 3 places you want to use try? ?
// 9 give some examples of using try. Have one with an error printed


// #6
//  1 nil coalescing, try optional, guard let, and if let

// #1
let myDict = [
    "Spider-Man": "Green Goblin",
    "Batman": "Joker",
    "Levi Ackermann": "Zeke Jaeger"
]

enum villainError: Error {
    case noVillainError
}

// guard let
func checkVillain(for hero: String) throws -> String? {
    guard let value = myDict[hero] else {
        print("No Villain")
        throw villainError.noVillainError
    }
    return myDict[hero]

}

var villain: String? = nil

// if let
if let villain = myDict["Flash"] {
    print("Flash's villain is \(villain)!")
} else {
    print("No Villain")
}
// guard let
do {
    var villain0 = try checkVillain(for: "Flash")
} catch {
    print(error.localizedDescription)
}

// nil coalescing
var villain1 = myDict["Flash"] ?? "No Villain"
print(villain1)

// optional try
var villain2 = try? checkVillain(for: "Flash")
print(villain2)

// optional try AND nil coalsescing
var villain3 = (try? checkVillain(for: "Flash")) ?? "No Villain"
print(villain3)


// 2 converting a string to an int

let numString = "3"
let numInt = Int(numString) ?? 0
print(numInt)

let numString2: String? = "3"
if let numString2 = numString2 {
   let numInt2 = Int(numString) ?? 0
    print(numInt2)
}


// 3 nil coalescing v. ternary operator
// the latter is a means of having 2 values to assign a var/const when a bool is either true or false
// the former is a means of assigning 1 value to a var/const when an optional is nil
var isCool = true
var myVar = isCool ? "Cool Kids :D" : "Not so cool :/"
print(myVar)

var isCool_: Bool? = true
isCool_ = isCool_ ?? false
print(isCool_ == true ? "Cool Kids :D" : "Not so cool :/")

// 4 i have a list of names. I want to assign 'chosen' as a random name from the list and then make it uppercase. If the value is nil, assign it as "No one". Print the result

let names = ["Eren", "Mikasa", "Armin"]
let randomChoice = names.randomElement()?.uppercased() ?? "Jean"
print(randomChoice)

// 5 i have a book struct with a name and in some cases an author. if i create a var that may or may not hold a book, i want to handle the case for when there is. Get the book, its author, and the first letter of the authors name lowercased. if there is no author, return "A"

struct Book {
    var name: String
    var author: String?
}

var book: Book? = Book(name: "The Stand", author: "Stephen King")
var firstLetter = book?.author?.lowercased() ?? "A"
print(firstLetter)

var books: [Book] = [
    Book(name: "The Stand", author: "Stephen King"),
    Book(name: "Diary of a Wimpy Kid", author: "Jeff Kinney"),
    Book(name: "The Walking Dead", author: "Robert Kirkman"),
    Book(name: "The Bible", author: nil)
]

for book in books {
    var firstLetter = book.author?.first?.lowercased() ?? "_"
    print("\(book.name): \(firstLetter)")
}

// Q -> What is a scenario where an optional book is useful?
// Idea -> A LIBRARY!!!

class Library {
    var name: String
    var inventory: [Book]
    
    init(_ name: String) {
        self.name = name
        self.inventory = [Book]()
    }
    
    func addBook(_ book: Book) {
        self.inventory.append(book)
    }
}

let library = Library("Zoll Library")
for book in books {
    library.addBook(book)
}
print()
for book in library.inventory {
    print(book.name)
}


