# Simple Counter
```swift
import UIKit

class MyTimer {
    var timer: Timer!
    
    init() {
        var n = 0
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            n += 1
            print("\(n)")
        }
    }
    
    public func stopTimer() {
        print("... STOPPPED.")
        self.timer.invalidate()
    }
}

let newTimer = MyTimer()

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    newTimer.stopTimer()
}

```

