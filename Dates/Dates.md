# How To Create Text of formatted Date (for right now)
```swift
Text(Date.now, format: .dateTime.month().day().year())
```
This gives a similar style of date:
```swift
Text(Date.now.formatted(date: .abbreviated, time: .omitted))
```