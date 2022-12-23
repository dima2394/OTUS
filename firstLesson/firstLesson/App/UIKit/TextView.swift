//
//  RepresetableView.swift
//  firstLesson
//
//  Created by Dmitriy Verennik on 14.12.2022.
//

import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {

    typealias UIViewType = UITextView
    @Binding var text: String?

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
