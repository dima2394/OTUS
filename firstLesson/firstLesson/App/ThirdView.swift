//
//  ThirdView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI

struct ThirdView: View {

    @State var isModallyViewPresented = false
    @State var text: String? = "Simple UIKit element with text under button"

    var body: some View {
        VStack(alignment: .center) {
            Button("Open Modally") {
                isModallyViewPresented.toggle()
            }
            TextView(text: $text)
                .frame(minWidth: 0,
                       idealWidth: .infinity,
                       maxWidth: .infinity,
                       minHeight: 0,
                       idealHeight: 100,
                       maxHeight: 200,
                       alignment: .center)
        }
        .sheet(isPresented: $isModallyViewPresented) {
            FourthModalView()
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
