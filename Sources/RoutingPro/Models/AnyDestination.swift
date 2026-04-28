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
    
    public init<T: View>(destination: T) {
        self.destination = AnyView(destination)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: AnyDestination, rhs: AnyDestination) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
