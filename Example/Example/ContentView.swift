//
//  ContentView.swift
//  Example
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import DGOverFullScreenView

struct ContentView: View {
    
    @State private var isPresenting: Bool = false
    
    var body: some View {
        ZStack {
            Color.purple
            
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

#Preview {
    ContentView()
}
