import SwiftUI

struct AlertButton: View {
    @State private var alertIsOn = false
    
    var body: some View {
        Button("Click me") {
            alertIsOn = true
        }
        .alert("Important Message", isPresented: $alertIsOn) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {}
        } message: {
            Text("Please read this")
        }
        .buttonStyle(.borderedProminent)
        .tint(.indigo)
    }
}