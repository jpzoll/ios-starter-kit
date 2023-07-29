import SwiftUI

struct Buttons_Images: View {
    var body: some View {
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2") {}
                .buttonStyle(.borderedProminent)
            Button("Button 3", role: .destructive) {}
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            Button {
                print("Button 5 tapped")
            } label: {
                Text("Button 5")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            Button {
                
            } label: {
                Text("Button 6")
                    .padding()
                    .background(RadialGradient(colors: [.black, .blue], center: .center, startRadius: 10, endRadius: 50))
                    .cornerRadius(30)
            }

            Image(systemName: "pencil")
                .frame(width: 30, height: 50)
            
            Button {
                
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
}