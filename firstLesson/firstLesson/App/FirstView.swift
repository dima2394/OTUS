//
//  FirstView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI

struct FirstView: View {

    @Binding var tabSelection: Int
    @Binding var itemSelecting: Int?

    var body: some View {
        NavigationView {
            VStack {
                Button("Push ME!") {
                    itemSelecting = 2
                    tabSelection = 1
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(tabSelection: .constant(1),
                  itemSelecting: .constant(2))
    }
}
