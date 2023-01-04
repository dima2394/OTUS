import SwiftUI

public struct NavigationScreen: Identifiable {

    public let id: String
    public let screenView: AnyView
}

// MARK: -  Equatable

extension NavigationScreen: Equatable {

    public static func == (lhs: NavigationScreen, rhs: NavigationScreen) -> Bool {
        lhs.id == rhs.id
    }
}
