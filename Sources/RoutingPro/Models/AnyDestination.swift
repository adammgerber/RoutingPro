//
//  AnyDestination.swift
//  ArchitectureBootcamp
//
//  Created by Adam Gerber on 28/04/2026.
//

import SwiftUI

@MainActor
public struct AnyDestination:  @MainActor Hashable {
    let id = UUID().uuidString
    var destination: AnyView
    
    public init<T: View>(destination: @autoclosure @escaping () -> T) {
        self.destination = AnyView(_DeferredView { destination() })
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: AnyDestination, rhs: AnyDestination) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

private struct _DeferredView<Content: View>: View {
    let build: () -> Content
    var body: some View { build() }
}
