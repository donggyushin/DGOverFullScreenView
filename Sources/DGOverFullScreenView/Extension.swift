//
//  Extension.swift
//
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI

extension View {
    public func overFullScreen<Content>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content : View {
        Text("")
    }
    
//    public func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View
}