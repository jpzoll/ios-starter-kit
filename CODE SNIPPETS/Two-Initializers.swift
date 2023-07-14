/* 
Say I have a Book struct that has title, pageCount, and readingHours as properties.
If I want the option for 2 possible initializers, one being the Memberwise Initializer (default)
and one that takes in title, pageCount, and then assigns readingHours as
the number of pages divided by 50, how could I implement that?
*/

// 1. Name the practice
// 2. Code it

// 1. Extension
// 2. See below

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let b1 = Book(title: "Grave of the Fireflies", pageCount: 30, readingHours: 5)
let b2 = Book(title: "The Stand", pageCount: 1000)
print(b1.readingHours)
print(b2.readingHours)
