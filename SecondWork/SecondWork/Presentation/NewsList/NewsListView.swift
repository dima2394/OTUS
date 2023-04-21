//
//  NewsListView.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import SwiftUI
import SwiftUINavigation

enum NewsCategory: String, CaseIterable {
    case bitcoin
    case tech
    case auto
}

struct NewsListView: View {

    @EnvironmentObject
    private var navigationModel: NavigationViewModel

    @State
    private var selectedCategory: String = NewsCategory.bitcoin.rawValue

    @StateObject
    private var viewModel = NewsListViewModel()
    
    private var pickerValues: [String] {
        NewsCategory.allCases.compactMap{$0.rawValue}
    }

    var body: some View {
        VStack {
            Picker("", selection: $selectedCategory) {
                ForEach(pickerValues, id: \.self) {
                    Text($0)
                        .tag($0)
                }
            }
            .onChange(of: selectedCategory, perform: { newValue in
                viewModel.reset()
                viewModel.fetchNews(query: selectedCategory.stringValue, language: "en")
            })
            .pickerStyle(.segmented)
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))

            List(viewModel.articles) { item in
                let isLast = viewModel.articles.isLast(item)
                NewsListCell(article: item)
                    .onAppear {
                        if isLast {
                            viewModel.fetchNews(query: selectedCategory.stringValue, language: "en")
                        }
                    }
                    .onTapGesture {
                        navigationModel.push(new: NewsDetailView(article: item))
                    }
            }
            .onAppear {
                viewModel.fetchNews(query: selectedCategory.stringValue, language: "en")
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
