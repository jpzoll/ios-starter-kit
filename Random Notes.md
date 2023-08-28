- When I want to reset a game AFTER an alert has been created, I can insert a dismissButton parameter that is of a button type. Buttons have a closure that handles the logic followed by clicking one. Therefore, the dismiss button clicked can handle the postgame logic
# How to Format a dollar amount in a Text view
Say we have a Transaction struct with an amt attribute that represents the amount of the transaction (in dollars as a *double*).
```swift
Text(transaction.amt, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
```