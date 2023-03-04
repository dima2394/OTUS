//
//  NewsListView.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import SwiftUINavigation
import Core
import Network

enum NewsCategory: String, CaseIterable {
    case bitcoin
    case tech
    case auto
}

final class NewsListState {

    @Injected var networkService: NetworkServiceProtocol?

    var currentPage = 0

    @Published
    var articles: [Article] = []

    var isLoading = false

    @Published
    var selectedCategory: String = NewsCategory.bitcoin.rawValue
}

struct NewsListEnvironment {
    @Injected var networkService: NetworkServiceProtocol?
}

struct NewsListView: View {

    @EnvironmentObject
    private var navigationModel: NavigationViewModel

    @State
    private var selectedCategory: String = NewsCategory.bitcoin.rawValue

    @StateObject
    private var viewModel = NewsListViewModel()

    private var environment = NewsListEnvironment()

    private var pickerValues: [String] {
        NewsCategory.allCases.compactMap{$0.rawValue}
    }

    enum Action {
        case resetData
        case update(articles: [Article])
        case fetchWithCompletion(completion: ([Article]) -> Void)
    }

    @ObservedObject
    var store = Store<NewsListState, Action, NewsListEnvironment>(state: NewsListState()) { state, action, env in
        var oldState = state
        switch action {
        case .fetchWithCompletion(let completion):
            var mutatingEnvironment = env
            oldState.currentPage += 1
            oldState.isLoading = true
            mutatingEnvironment.networkService?.fetchAllNews(query: state.selectedCategory,
                                                             apiKey: "8160581966824d818db22e92f800c6ee",
                                                             page: state.currentPage,
                                                             pageSize: 20,
                                                             language: "en") { result in
                defer {
                    oldState.isLoading = false
                }
                switch result {
                case .success(let newsList):
                    oldState.articles = newsList.articles ?? []
                    completion(newsList.articles ?? [])
                case .failure(let error):
                    debugPrint("❌ \(#function) \(error.localizedDescription)")
                }
            }
        case .resetData:
            oldState.currentPage = 0
            oldState.articles = []
        case .update(let articles):
            oldState.articles.append(contentsOf: articles)
        }
        return oldState
    }

    var body: some View {
        let fetchCompletionAction: Action = .fetchWithCompletion { articles in
            store.dispatch(action: .update(articles: articles), environment: environment)
        }
        VStack {
            Picker("", selection: $store.state.selectedCategory) {
                ForEach(pickerValues, id: \.self) {
                    Text($0)
                        .tag($0)
                }
            }
            .onChange(of: store.state.selectedCategory, perform: { newValue in
                store.dispatch(action: .resetData, environment: environment)
                store.dispatch(action: fetchCompletionAction, environment: environment)
            })
            .pickerStyle(.segmented)
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))

            List($store.state.articles) { item in
                let isLast = store.state.articles.isLast(item)
                NewsListCell(article: item.wrappedValue)
                    .onAppear {
                        if isLast {
                            viewModel.fetchNews(query: selectedCategory.stringValue, language: "en")
                        }
                    }
                    .onTapGesture {
                        navigationModel.push(new: NewsDetailView(article: item.wrappedValue))
                    }
            }
            .onAppear {
                store.dispatch(action: fetchCompletionAction, environment: environment)
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
