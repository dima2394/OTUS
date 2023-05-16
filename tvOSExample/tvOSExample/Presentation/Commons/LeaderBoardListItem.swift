//
//  LeaderBoardListItem.swift
//  tvOSExample
//
//  Created by Dmitriy Verennik on 16.05.2023.
//

import SwiftUI

struct LeaderBoardListItem: View {

    let position: Int
    let title: String
    let score: Int

    var body: some View {
        HStack {
            Text("\(position).")
                .typesForegroundColor()

            Text(title)
                .typesForegroundColor()

            Spacer()

            Text("\(score)")
                .typesForegroundColor()
        }
    }
}

extension Text {

    func typesForegroundColor() -> Text {
#if os(watchOS)
        self.foregroundColor(.white)

#else
        self.foregroundColor(.black)
#endif
    }
}

struct LeaderBoardListItem_Previews: PreviewProvider {

    static var previews: some View {
        LeaderBoardListItem(position: 1,
                            title: "First",
                            score: 345)
    }
}

