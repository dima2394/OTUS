//
//  Leader.swift
//  tvOSExample
//
//  Created by Dmitriy Verennik on 16.05.2023.
//

import Foundation

struct Leader: Equatable, Hashable {

    let position: Int
    let title: String
    let score: Int
}

// MARK: -  Mock

extension Leader {

    static var mocked: [Leader] {
        [
            .init(position: 1, title: "First", score: 1234),
            .init(position: 2, title: "Second", score: 1200),
            .init(position: 3, title: "Third", score: 1145),
            .init(position: 4, title: "Fourth", score: 1100),
            .init(position: 5, title: "Fifth", score: 1095),
            .init(position: 5, title: "Sixth", score: 789)
        ]
    }
}
