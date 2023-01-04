//
//  NavigationStack.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import Foundation

struct NavigationStack {

    var screens = [NavigationScreen]()

    func top() -> NavigationScreen? {
        screens.last
    }

    mutating func push(new screen: NavigationScreen) {
        screens.append(screen)
    }

    @discardableResult
    mutating func pop() -> NavigationScreen? {
        screens.popLast()
    }

    mutating func popToRoot() {
        screens.removeAll()
    }
}
