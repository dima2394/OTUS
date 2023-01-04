//
//  NavigationViewModel.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import SwiftUI

class NavigationViewModel: ObservableObject {

    @Published var currentScreen: NavigationScreen?

    private let easing: Animation
    var navigationType: NavigationType = .push

    var screensStack = NavigationStack() {
        didSet {
            currentScreen = screensStack.top()
        }
    }

    init(easing: Animation) {
        self.easing = easing
    }

    func push<V: View>(new view: V) {
        withAnimation(easing) {
            let screen = NavigationScreen(id: UUID().uuidString, screenView: AnyView(view))
            screensStack.push(new: screen)
        }
    }

    func pop(destination: PopDestination = .pop) {
        withAnimation(easing) {
            switch destination {
            case .pop:
                navigationType = .pop
                screensStack.pop()
            case .popToRoot:
                navigationType = .pop
                screensStack.popToRoot()
            }
        }
    }
}
