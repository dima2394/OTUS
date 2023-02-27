//
//  Article+Identifiable.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import Network

extension Article: Identifiable {

    public typealias ID = String

    public var id: String {
        url
    }
}
