# DGOverFullScreenView

SwiftUI View that can be dismissed by dragging

![ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/bda23351-baa5-4c77-8b5e-37f8c1e134c3)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/documentation/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding `DGOverFullScreenView` as a dependency is as easy as adding it to the dependencies value of your Package.swift or the Package list in Xcode.

```
dependencies: [
   .package(url: "https://github.com/donggyushin/DGOverFullScreenView", .upToNextMajor(from: "1.0.0"))
]
```

Normally you'll want to depend on the DGOverFullScreenView target:

```
.product(name: "DGOverFullScreenView", package: "DGOverFullScreenView")
```

## Usage

```swift
import SwiftUI
import DGOverFullScreenView

struct ContentView: View {

    @State private var isPresenting: Bool = false

    var body: some View {
        VStack {

            Text("Parent View")

            Button("Show") {
                withAnimation {
                    isPresenting = true
                }
            }
        }
        .overFullScreen(isPresented: $isPresenting) {
            ZStack {
                Color.black
                Button("Dismiss") {
                    withAnimation {
                        isPresenting = false
                    }
                }
            }
        }
    }
}
```
