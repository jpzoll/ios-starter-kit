Say I want to create a list of days with their low and high temperatures as you see in typical weather apps. For example, we will use the following arbitrary data:
```swift
let highTemperatures = [52, 55, 54, 58, 57, 55, 53, 53, 53, 53]
let highTemperatures = [52, 55, 54, 58, 57, 55, 53, 53, 53, 53]
let days = ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon"]
```
The following view would produce a pleasant blue box containing the list of days accompanied by their temperatures. You can even insert images like the sun, clouds, etc. within each row.
```swift
struct TenDayWindSpeedView: View {
    let lowWindSpeeds = [52, 55, 54, 58, 57, 55, 53, 53, 53, 53]
    let highWindSpeeds = [52, 55, 54, 58, 57, 55, 53, 53, 53, 53]
    let days = ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("10-DAY FORECAST").font(.caption).opacity(0.5)
            List(days.indices, id: \.self) { i in
                HStack {
                    Text(days[i])
                        .frame(maxWidth: 50, alignment: .leading)
                    
                    Text(String(lowWindSpeeds[i]))
                        .frame(maxWidth: .infinity)
                    
                    Text(String(highWindSpeeds[i]))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .listRowBackground(Color.blue)
            }
            .listStyle(.plain)
        }
        .frame(height: 300)
        .padding()
        .background(content: {
            Color.blue
        })
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .foregroundColor(.white)
    }
}
```
<center>
<img width="387" alt="ny" src="https://github.com/jpzoll/ios-starter-kit/assets/55609216/c35ff78f-3a23-42cb-a821-84fc6597be40">
</center>

