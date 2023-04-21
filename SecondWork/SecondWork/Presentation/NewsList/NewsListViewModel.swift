//
//  NewsListViewModel.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import Network

final class NewsListViewModel: ObservableObject {

    enum Constants {
        static let pageSize = 20
    }

    @Published
    var articles: [Article] = []
    var isLoading = false
    private var isPagingAvailable = true
    var currentPage = 0

    func fetchNews(query: String = "bitcoin",
                   language: String = "en") {
        guard !isLoading,
              isPagingAvailable
        else {
            return
        }
        isLoading = true
        currentPage += 1
        FetchNewsAPI.getAllNews(q: query,
                                page: currentPage,
                                pageSize: Constants.pageSize,
                                language: language) { [weak self] newsList, error in
            defer {
                self?.isLoading = false
            }
            guard let self = self else {
                return
            }

            if let error = error {
                //produce error
                debugPrint("❌ \(#function) \(error.localizedDescription)")
                return
            }
            guard let articles = newsList?.articles else {
                return
            }
            self.isPagingAvailable = newsList?.totalResults != articles.count
            self.articles.append(contentsOf: articles)
        }
    }

    func reset() {
        currentPage = 0
        articles = []
    }
}
