//
//  SafariView.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {

    let url: URL
    weak var delegate: SFSafariViewControllerDelegate?

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url)
        controller.delegate = delegate
        return controller
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        return
    }
}
