//
//  RandomAccessCollection+IsLast.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {

    public func isLast<Item: Identifiable>(_ element: Item) -> Bool {
        guard !isEmpty,
              let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(element.id) })
        else {
            return false
        }
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}
