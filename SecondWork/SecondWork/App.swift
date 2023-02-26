//
//  SecondWorkApp.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 30.12.2022.
//

import SwiftUI
import SwiftUINavigation

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationViewController(transition: .custom(push: .opacity.combined(with: .push(from: .trailing)),
                                                         pop: .opacity)) {
                NewsListView()
            }
        }
    }
}
