# How To Create Text of formatted Date (for right now)
```swift
Text(Date.now, format: .dateTime.month().day().year())
```
This gives a similar style of date:
```swift
Text(Date.now.formatted(date: .abbreviated, time: .omitted))
```

# How to extract numerical data from a date
Say we have a date, let's use the date right now:
```swift
let myDate = Date.now
```
If I want to get the month, day, and year for the date now, we can use the following:
```swift
let dateComponents = Calendar.current.dateComponents([.month, .day, .year], from: myDate)

// From here, do whatever you want. This demo prints them out

print(dateCompoments.month ?? 0)
print(dateCompoments.day ?? 0)
print(dateCompoments.year ?? 0)
```
We use nil-coalescing because it returns an optional Int.

# How to find the no. of days between 2 dates
```swift
var daysLeft: Int {
	let secondsInDay = 86400
	return Int(date.timeIntervalSince(Date.now) / 86400)
}```
There are 86,400 seconds in a day. When we use the **timeIntervalSince** method for dates, we can find the number of seconds between two dates. From there, we can divide that value by 86,400 to get the number of days between two dates.