// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

struct Container: View {
    
    @Binding var isPresented: Bool
    let content: AnyView
    let presenting: AnyView
    let onDismiss: (() -> Void)?
    
    @State private var yOffset: CGFloat = 0
    
    init(
        isPresented: Binding<Bool>,
        content: any View,
        presenting: any View,
        onDismiss: (() -> Void)?
    ) {
        _isPresented = isPresented
        self.content = .init(content)
        self.presenting = .init(presenting)
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        presenting
            .overlay {
                GeometryReader { geometry in
                    if isPresented {
                        content
                            .ignoresSafeArea()
                            .offset(y: yOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        yOffset = value.translation.height
                                    }
                                    .onEnded { value in
                                        let height = geometry.size.height
                                        let offsetPercentage = yOffset / height
                                        
                                        if offsetPercentage > 0.45 {
                                            withAnimation {
                                                isPresented = false
                                            }
                                        } else {
                                            
                                            if value.velocity.height > 600 {
                                                withAnimation {
                                                    isPresented = false
                                                    
                                                }
                                            }
                                        }
                                        yOffset = 0
                                    }
                            )
                            .transition(.move(edge: .bottom))
                            .animation(.linear, value: yOffset)
                    }
                }
            }
    }
}
