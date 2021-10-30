//
//  View+Extension.swift
//  View+Extension
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

extension View {
    @inlinable func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        return frame(width: size.width, height: size.height, alignment: alignment)
    }
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
    
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    
#if canImport(UIKit)
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
#endif
    
}

extension View {
    func push<V: View>(_ view: V, toggle: Binding<Bool>) -> some View {
        NavigationLink(destination: view, isActive: toggle) {
            EmptyView()
        }
    }
}

extension AnyView {
    static let defaultError = AnyView(Text("View does not exist"))
}
