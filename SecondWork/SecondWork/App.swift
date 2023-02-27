//
//  SecondWorkApp.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import SwiftUI
import SwiftUINavigation
import Core

@main
struct MainApp: App {

    init() {
        registerServices()
    }

    private func registerServices() {
        let networkService: NetworkServiceProtocol = NetworkService()
        ServiceLocator.shared.add(networkService)
    }

    var body: some Scene {
        WindowGroup {
            NavigationViewController(transition: .custom(push: .opacity.combined(with: .push(from: .trailing)),
                                                         pop: .opacity)) {
                NewsListView()
            }
        }
    }
}
