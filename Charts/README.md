# Charts - Basic Bar Chart Example
In order to utilize the **Charts** library in Swift, you first must have it imported in your code:
```swift
import SwiftUI
import Charts
```
In this example, I will plot arbitrary values from different college major departments. I create a **struct** for this:
```swift
struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Int

}
```
Here is what our ContentView then looks like. Here are the steps we follow:
1. Initalize items array with your data points
2. Nest your views as follows
	1. NavigationView
	2. ScrollView
	3. Chart
	4. BarMark **bold**
3. The BarMark passes your items array which is iterated over with an x and y value
4. Modify your views with styling that pleases you!
```swift
struct ContentView: View {
	let items: [Item] = [
    Item(type: "Computer Science", value: 80),
    Item(type: "Physics", value: 88),
    Item(type: "iSchool", value: 63),
    Item(type: "Engineering", value: 76),
    Item(type: "Math", value: 83)
]

	var body: some View {
	
	    NavigationView {
	
	        ScrollView {
	
	            Chart(items) { item in
	                BarMark(
	                    x: .value("Department", item.type),
	                    y: .value("Department", item.value)
	                )
	            }
	
	            .frame(height: 200)
	            .padding()
	            .foregroundStyle(Color.green.gradient)
	        }
	        .navigationTitle("Charts")
	    }
    }
}

```
## Result
![[Pasted image 20230602122817.png]]