//
//  ContentView.swift
//  SuffixIterator
//
//  Created by Dmitriy Verennik on 21.04.2023.
//

import SwiftUI

enum SortType: String, CaseIterable, Hashable {
    case ascending
    case descending

    var title: String {
        switch self {
        case .ascending:
            return ">"
        case .descending:
            return "<"
        }
    }
}

struct SuffixSearchView: View {

    @State
    var sortTypeSelector = SortType.ascending

    @State
    private var searchText = ""

    @ObservedObject
    private var viewModel = SuffixSearchViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("Сортировка:")
                Spacer()
                Picker("", selection: $sortTypeSelector) {
                    ForEach(SortType.allCases, id: \.self) { type in
                        Text(type.title)
                    }
                }
                .onChange(of: sortTypeSelector, perform: { newValue in
                    viewModel.applySearchText(viewModel.searchSubject.value,
                                              sortType: newValue)
                })
                .pickerStyle(.segmented)
            }
            .padding()
            TextField("Введите слово для поиска...", text: $searchText)
                .font(.caption)
                .autocorrectionDisabled()
                .fontDesign(.monospaced)
                .frame(height: 80)
                .border(Color.black.opacity(0.2))
                .cornerRadius(10)
                .padding([.leading, .trailing], 12)
                .onChange(of: searchText) { newValue in
                    viewModel.applySearchText(newValue, sortType: sortTypeSelector)
                }

            VStack {
                HStack {
                    Text("Суффикс")
                    Spacer()
                    Text("Время")
                }
                List {
                    ForEach(viewModel.models, id: \.self) { model in
                        HStack {
                            Text(model.value)
                            Spacer()
                            Text("\(model.searchTime) нс")
                                .applyEfficientColor(elements: viewModel.models, element: model)
                        }
                    }
                }
            }
            .padding([.horizontal], 16)
        }
        .onAppear {
            viewModel.subscribeSearch()
        }
    }
}

struct SuffixSearch_Previews: PreviewProvider {
    static var previews: some View {
        SuffixSearchView()
    }
}


extension View  {

    func applyEfficientColor<T: Equatable>(elements: [T], element: T) -> some View {
        var backgroundColor = Color.clear
        if elements.first == element {
            backgroundColor = .green.opacity(0.6)
        } else if elements.last == element {
            backgroundColor = .red.opacity(0.6)
        }
        return self.background(backgroundColor)
    }
}
