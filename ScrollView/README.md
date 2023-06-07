# Hourly Forecast Example

Say we want to create an hourly forecast with the following times and temperatures:
```swift
let hourlyWindSpeed = [65, 68, 69, 67, 68, 69, 67, 67, 70, 71, 71, 73, 74, 75, 76, 76, 77, 77, 78, 74, 70, 68]

let hours = ["12:00am", "1:00am", "2:00am", "3:00am", "4:00am", "5:00am", "6:00am", "7:00am", "8:00am","9:00am", "10:00am", "11:00am", "12:00pm"]
```
In order to do this, we have to create a **ScrollView**, which you use inside of a **View**.
```swift
struct HourlyForecastView: View {
	
	let hourlyForecast = [65, 68, 69, 67, 68, 69, 67, 67, 70, 71, 71, 73, 74, 75, 76, 76, 77, 77, 78, 74, 70, 68]

	let hours = ["12:00am", "1:00am", "2:00am", "3:00am", "4:00am", "5:00am", "6:00am", "7:00am", "8:00am","9:00am", "10:00am", "11:00am", "12:00pm"]

	VStack(.leading) {
		ScrollView(.horizontal) {
			ForEach(hours.indices, id: \.self) { i in
				VStack {
					Text("\(hours[i])")
					Text("\(hourlyForecast[i])")
				}
			}
		}
	}
}
```

For the example I actually used, there is much more font styling, padding, etc. For the purposes of understanding how to create a simply scrolling-through-of temperatures per hour, this will give you the foundation of what you need for that.