//
//  ContentView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI

struct MainView: View {

    @State var tabSelectionIndex: Int = 0
    @State var deepItemSelectionIndex: Int?

    var body: some View {
        TabView(selection: $tabSelectionIndex) {
            FirstView(tabSelection: $tabSelectionIndex,
                      itemSelecting: $deepItemSelectionIndex)
                .tag(0)
                .tabItem {
                    Text("First")
                    Image(systemName: "globe.europe.africa")
                }
            SecondView(selectionIndex: $deepItemSelectionIndex)
                .tag(1)
                .tabItem {
                    Text("Second")
                    Image(systemName: "info.circle")
                }
            ThirdView()
                .tag(2)
                .tabItem {
                    Text("Third")
                    Image(systemName: "square.and.pencil.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
