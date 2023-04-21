//
//  NewsListViewModel.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import Network
import Core

final class NewsListViewModel: ObservableObject {

    enum Constants {
        static let pageSize = 20
        static let apiKey = "8160581966824d818db22e92f800c6ee"
    }

    @Published
    var articles: [Article] = []

    var isLoading = false
    private var isPagingAvailable = true
    var currentPage = 0

    @Injected var networkService: NetworkServiceProtocol?

    func fetchNews(query: String = "bitcoin",
                   language: String = "en") {
        guard !isLoading,
              isPagingAvailable
        else {
            return
        }
        isLoading = true
        currentPage += 1
        networkService?.fetchAllNews(query: query,
                                     apiKey: Constants.apiKey,
                                     page: currentPage,
                                     pageSize: Constants.pageSize,
                                     language: language) { [weak self] result in
            defer {
                self?.isLoading = false
            }

            guard let self = self else {
                return
            }

            switch result {
            case .success(let newsList):
                self.isPagingAvailable = newsList.totalResults != newsList.articles?.count
                self.articles.append(contentsOf: newsList.articles ?? [])
            case .failure(let error):
                debugPrint("❌ \(#function) \(error.localizedDescription)")
            }
        }
    }

    func reset() {
        currentPage = 0
        articles = []
    }
}
