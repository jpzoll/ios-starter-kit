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