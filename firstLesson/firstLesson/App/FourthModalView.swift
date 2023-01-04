//
//  FourthModalView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 23.12.2022.
//

import SwiftUI

struct FourthModalView: View {

    @Environment(\.dismiss) var dismissView

    var body: some View {
        NavigationView {
            Button("Dismiss") {
                dismissView()
            }
            .navigationTitle("Modal Presented View")
        }
    }
}

struct FourthModalView_Previews: PreviewProvider {
    static var previews: some View {
        FourthModalView()
    }
}
