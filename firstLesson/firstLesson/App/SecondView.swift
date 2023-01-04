//
//  SecondView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI

enum ListCases: Int, CaseIterable {

    case first
    case second
    case third
}

struct SecondView: View {

    @Binding var selectionIndex: Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<3) { index in
                    NavigationLink(tag: index, selection: $selectionIndex) {
                        SecondDestinationView(initialText: "\($selectionIndex.wrappedValue ?? 0)")
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("List item \(index)")
                        }
                    }
                    .isDetailLink(true)
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(selectionIndex: .constant(1))
    }
}
