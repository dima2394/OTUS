import SwiftUI

public enum NavigationAnimationType {

    case none
    case custom(push: AnyTransition, pop: AnyTransition)
}
