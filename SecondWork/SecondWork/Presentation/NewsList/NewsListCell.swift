//
//  NewsListCell.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import Network

struct NewsListCell: View {

    enum Constants {
        static let insets: EdgeInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
    }

    let article: Article

    var body: some View {

        HStack(alignment: .top, spacing: 10) {
            AsyncImage(url: article.urlToImage?.url)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(article.title)
                    .fontWeight(.bold)
                Divider()
                HStack(alignment: .bottom) {
                    Text(article.publishedAt.prettyDate)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.blue)
                        .font(.footnote)
                    Spacer()
                    Text(article.author ?? "")
                        .font(.footnote)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(article: Article.mockObject)
    }
}
