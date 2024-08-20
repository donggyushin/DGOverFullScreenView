// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

struct Container: View {
    
    @Binding var isPresented: Bool
    let content: AnyView
    let presenting: AnyView
    let onDismiss: (() -> Void)?
    
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
                if isPresented {
                    content
                }
            }
    }
}
