//
//  LeaderBoardView.swift
//  tvOSExample
//
//  Created by Dmitriy Verennik on 16.05.2023.
//

import SwiftUI

struct LeaderBoardView: View {

    private let leaders = Leader.mocked

    var body: some View {
        List {
            ForEach(leaders, id: \.self) {
                LeaderBoardListItem(position: $0.position,
                                    title: $0.title,
                                    score: $0.score)
            }
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
