# Closures
Say we want to create a filter that gets students with topScore's of over 80
```swift
func studentFilter(student: Student) -> Bool {					
	return student.topScore > 80
}
```
If we have an array of students ***studentArray***, we can filter out for those particular students using this closure:
```swift
let s = studentArray.filter(studentFilter)
```


In another scenario, we may want to sort the array based on if the first value is greater than the second.
```swift
let a = studentArray.sorted {
	$0.topScore > $1.topScore
}
```

# <span style="color:#fc7bb3">@escaping</span> - What does that mean?
When you see @escaping, that is referring to an **Escaping Closure**. This type of closure is one that **outlives the function that it is contained inside of.** This means that the function can return before the closure is called.

