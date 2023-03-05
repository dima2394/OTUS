//
//  NewsListState.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 05.03.2023.
//

import Combine
import Core
import Network

enum NewsCategory: String, CaseIterable {
    case bitcoin
    case tech
    case auto
}

final class NewsListState {

    var currentPage = 0

    @Published
    var articles: [Article] = []

    var isLoading = false

    @Published
    var selectedCategory: String = NewsCategory.bitcoin.rawValue
}
