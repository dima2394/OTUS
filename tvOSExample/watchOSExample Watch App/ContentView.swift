//
//  ContentView.swift
//  watchOSExample Watch App
//
//  Created by Dmitriy Verennik on 16.05.2023.
//

import SwiftUI

struct ContentView: View {

    let leaders = Leader.mocked

    var body: some View {

        VStack {
            List {
                ForEach(leaders, id: \.self) { leader in
                    LeaderBoardListItem(position: leader.position, title: leader.title, score: leader.score)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
