//
//  NewsDetailView.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import Network
import SwiftUINavigation
import SafariServices

struct NewsDetailView: View {

    @EnvironmentObject
    var navigationModel: NavigationViewModel

    let article: Article

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: article.urlToImage?.url) { image in
                    image.image?.resizable()
                        .scaledToFill()
                        .padding(.vertical, 8)
                }

                Button("Go to web site") {
                    if let url = article.url.url {
                        navigationModel.push(new: SafariView(url: url))

                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            navigationModel.pop()
                        }
                    }
                }

                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .foregroundColor(.primary)

                Text(article.content)
                    .font(.body)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .foregroundColor(.primary)
            }
        }
        .padding(.horizontal)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(article: Article.mockObject)
    }
}
