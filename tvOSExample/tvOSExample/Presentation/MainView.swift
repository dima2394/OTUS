//
//  ContentView.swift
//  tvOSExample
//
//  Created by Dmitriy Verennik on 16.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {

        NavigationView {

            ZStack {
                LinearGradient(colors: [.blue, .red],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                TabView {
                    PlayView()
                        .tabItem { Text("Play") }

                    LeaderBoardView()
                        .tabItem { Text("LeaderBoard") }

                    SettingsView()
                        .tabItem { Text("Settings") }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
