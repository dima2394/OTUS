//
//  RepresetableView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI
import UIKit

struct RepresetableView: UIViewRepresentable {


//    var body: some View {
//        Text("Hello, World!")
//    }

    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}

struct RepresetableView_Previews: PreviewProvider {
    static var previews: some View {
        RepresetableView()
    }
}
