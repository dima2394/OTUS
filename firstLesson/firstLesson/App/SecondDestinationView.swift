//
//  SecondDestinationView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI

struct SecondDestinationView: View {

    let initialText: String

    var body: some View {
        Text("Hello, list item \(initialText)")
    }
}

struct SecondDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDestinationView(initialText: "Hello World")
    }
}
