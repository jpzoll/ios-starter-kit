import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(1...10, id: \.self) { _ in
                HStack {
                    ForEach(1...10, id: \.self) { _ in
                        getRandomColor()
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
    }
}


func getRandomColor() -> Color {
    let possibleColors: [Color] = [
        Color.red,
        Color.blue,
        Color.green
    ]
    return possibleColors.randomElement() ?? Color.green
}