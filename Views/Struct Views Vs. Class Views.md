- Why do we use struct views in SwiftUI? What advantage does this have over class views implemented in UIKit?
- What is behind SwiftUI's ContentView?

An important thing to understand about view modifiers is that **order matters**. If we take a look under the hood of our view using *type(of: ..)*. we can see how a view is comprised:
```swift
struct ContentView: View {
    var body: some View {
        Button("Hello, world") {
            print(type(of: self.6body))
        }
    }
}```
If we click this button, our output is:
```
Button<Text>
```
What if I want to modify the button? Let's say we give it a 200x200 frame and a green background:
```swift
struct ContentView: View {
    var body: some View {
        Button("Hello, world") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(Color.green)
    }
}```
Upon clicking the button, we now get:
```
ModifiedContent<ModifiedContent<Button<Text>, _FrameLayout>, _BackgroundStyleModifier<Color>>
```
We can see from this result that SwiftUI nests modified views upon one another. This means that when we modify a view, it creates a copy of that view with its new properties.
In this case, this is our order
1. The button is created and modified to have a 200x200 Frame layout. This is a copy and is designated as **ModifiedContent**
2. *That* copy is modified to have a green background, meaning the ModifiedContent is nested within another ModifiedContent. The parent ModifiedContent has the BackgroundStyleModifier with the color attached
### What is the significance of this?
If we swapped the order, first providing a green background *and then* a 200x200 frame layout, we would get a small green background barely encapsulating the text while also having a 200x200. The thing is, the 200x200 frame would not be noticeable to the human eye. Only if we add another color *after* that 200x200 frame would we see that visually.
It makes sense if you think about it. If we first add a colored background, that creates a copy with the colored background attached to the default size (barely encapsulating the text). The frame layout modifies *that* copy, which itself is now a created view that cannot be changed.
Therefore, it is important to remember that order matters when modifying your views.


`
-----

# How are views processed under the hood?
If we have a VStack, all the views inside of it are fit as arguments inside of a tuple called **TupleView**. TupleView can contain up to 10 views, and no more than that. If we look at the SwiftUI interface code, we can actually see 10 instances of TupleView, each corresponding to the 10 amounts of views we can insert.
```swift
// Example showing option for 3 views
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0 : View, C1 : View, C2 : View
}```
##### Here is the actual TupleView struct:
```swift
@frozen public struct TupleView<T> : View {

    public var value: T

    @inlinable public init(_ value: T)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never
}```
