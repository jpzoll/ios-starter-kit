- When I want to reset a game AFTER an alert has been created, I can insert a dismissButton parameter that is of a button type. Buttons have a closure that handles the logic followed by clicking one. Therefore, the dismiss button clicked can handle the postgame logic
# How to Format a dollar amount in a Text view
Say we have a Transaction struct with an amt attribute that represents the amount of the transaction (in dollars as a *double*).
```swift
Text(transaction.amt, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
```
# How To Create Unit Testing File
1. New
2. Target
3. Search for *Test*
4. Click **Unit Testing Bundle**
5. Use the following to import your app and its data. For example, if my app is called *MoneyTracker*:
```swift
import XCTest
@testable import MoneyTracker // Here is where you import your app


/*
The following is an example unit test I did for learning purposes of a simple money tracking app
*/

final class TransactionTests: XCTestCase {
    
    func testSuccessfulTransactionProcess() {
        let transactionProcessor = TransactionProcessor()
        var transactions = [Transaction]()
        
		transactionProcessor.processTransaction("Lottery", "Income", 1_000_000, &transactions)
        
        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(transactions[0].name, "Lottery")
        XCTAssertEqual(transactions[0].type, "Income")
        XCTAssertEqual(transactions[0].amt, 1_000_000)
    }

}
```
# How To Make a "Springing Ball" Animation as a Button
```swift
struct ContentView: View {
    @State private var animationLvl = 1.0
    @State private var isIncreasing = true
    var body: some View {
        VStack {
            Button("Tap Me") {
                if isIncreasing && animationLvl < 5 {
                    animationLvl += 1
                } else if isIncreasing && animationLvl >= 5 {
                    isIncreasing = false
                    animationLvl -= 1
                } else if !isIncreasing && animationLvl > 1 {
                    animationLvl -= 1
                } else if !isIncreasing && animationLvl <= 1 {
                    isIncreasing = true
                    animationLvl += 1
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationLvl)
            .blur(radius: (animationLvl - 1) * 3)
            .animation(.interpolatingSpring(stiffness: 500.0, damping: 1.0), value: animationLvl)
            
        }
        .padding()
    }
}```

The key to this is the ***interpolatingSpring*** animation used as the last modifier of the "Tap Me" Button.
##### If you want to make the ball spring forever and never stop, assign the damping value to 0.

# How to make a circle clicking animation on a button
```swift
struct ContentView: View {
    @State private var animationLvl = 1.0
    @State private var isIncreasing = true
    var body: some View {
        VStack {
            Button("Tap Me") {
                if isIncreasing && animationLvl < 5 {
                    animationLvl += 1
                } else if isIncreasing && animationLvl >= 5 {
                    isIncreasing = false
                    animationLvl -= 1
                } else if !isIncreasing && animationLvl > 1 {
                    animationLvl -= 1
                } else if !isIncreasing && animationLvl <= 1 {
                    isIncreasing = true
                    animationLvl += 1
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay (
                Circle()
                    .stroke(.red)
                    .background(Circle().foregroundColor(Color.blue.opacity(4 - animationLvl)))
                    .scaleEffect(animationLvl)
                    .opacity(2 - animationLvl)
                    .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: animationLvl)
                
            )
        }
        .onAppear {
            animationLvl = 2
        }
        .padding()
    }
}```

# Animating Bindings
Inspiration comes from the following section in 100 Days of SwiftUI: [https://www.hackingwithswift.com/books/ios-swiftui/animating-bindings]

In addition to animating our views, we can also manipulate value bindings to animate changes of their values as they happen. For instance, we can animate number value increases or decreases in a int or double or even a boolean change from true to false / false to true.

*How is this possible?*

This is possible because in these types of animations, the bindings know that the value change will trigger an animation, as we will see in the upcoming example. SwiftUI looks at the exact value of the binding before and after the change, and in between applies the animation that gets it from the original value to the new value.

This is different from animations applied to views, where in that case views understand that they are being animated and State variables are NOT aware of that. The vice versa is true here: Bindings know that the state change will trigger an animation and the views are NOT aware of that.
