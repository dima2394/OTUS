//
//  NavigationAnimationType.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import SwiftUI

enum NavigationAnimationType {

    case none
    case custom(push: AnyTransition, pop: AnyTransition)
}
