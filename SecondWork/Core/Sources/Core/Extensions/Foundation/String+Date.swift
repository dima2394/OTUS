//
//  String+Date.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import Foundation

public extension String {

    private static var dateFormatterGetter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }

    private static var dateFormatterPrinter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter
    }

    var prettyDate: String {
        guard let date = Self.dateFormatterGetter.date(from: self) else {
            return ""
        }
        return Self.dateFormatterPrinter.string(from: date)
    }
}
