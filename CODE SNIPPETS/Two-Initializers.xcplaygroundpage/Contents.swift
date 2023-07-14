// Create a book struct with two memberwise initializers

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
