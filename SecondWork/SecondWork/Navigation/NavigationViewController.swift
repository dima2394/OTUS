//
//  NavigationViewController.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import SwiftUI

struct NavigationViewController<Content: View>: View {

    @ObservedObject
    private var viewModel: NavigationViewModel = .init(easing: .easeOut(duration: 0.3))
    var content: Content
    var transition: (push: AnyTransition, pop: AnyTransition)

    init(viewModel: NavigationViewModel,
         transition: NavigationAnimationType,
         @ViewBuilder contentBuilder: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        switch transition {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let push, let pop):
            self.transition = (push, pop)
        }
    }

    var body: some View {
        let isRoot = viewModel.currentScreen == nil

        return ZStack {
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            case false:
                viewModel.currentScreen?.screenView
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
