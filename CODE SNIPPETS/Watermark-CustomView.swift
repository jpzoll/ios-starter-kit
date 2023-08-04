struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing){
            content
            
            Text(text)
                .padding(3)
                .font(.caption)
                .background(.black)
                .foregroundColor(.white)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        return modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        return modifier(Watermark(text: text))
    }
}