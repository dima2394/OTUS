//
//  NavigationScreen.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import SwiftUI

struct NavigationScreen: Identifiable {

    let id: String
    let screenView: AnyView
}

// MARK: -  Equatable

extension NavigationScreen: Equatable {

    static func == (lhs: NavigationScreen, rhs: NavigationScreen) -> Bool {
        lhs.id == rhs.id
    }
}
