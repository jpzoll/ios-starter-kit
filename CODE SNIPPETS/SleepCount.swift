// Beginner Stepper to enter the number of hours of
// sleep for the user. Increments by 0.25 hours
// and is constrained to be between 4 -> 12 hours of sleep

struct ContentView: View {
    @State private var hoursOfSleep = 8.0
    
    var body: some View {
        Stepper("\(hoursOfSleep.formatted()) hours of sleep", value: $hoursOfSleep, in: 4...12, step: 0.25)
            .padding()
    }
}