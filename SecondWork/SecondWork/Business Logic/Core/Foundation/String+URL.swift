//
//  String+URL.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import Foundation

extension String {

    var url: URL? {
        URL(string: self)
    }
}

extension Optional where Wrapped == String {

    var url: URL? {
        guard let string = self else {
            return nil
        }
        return URL(string: string)
    }
}
