//
//  SuffixSearchViewModel.swift
//  SuffixIterator
//
//  Created by Dmitriy Verennik on 21.04.2023.
//

import Combine
import SwiftUI

final class SuffixSearchViewModel: ObservableObject {

    lazy var searchSubject = CurrentValueSubject<String, Never>("")
    private var searchTextCancellable: AnyCancellable?
    private var bag = Set<AnyCancellable>()

    private var searchTask: Task<(), Never>?
    private var sortType: SortType = .ascending


    @Published
    var models = [Suffix]()

    func applySearchText(_ text: String, sortType: SortType) {
        self.sortType = sortType
        searchSubject.send(text)
    }

    func subscribeSearch() {
        searchSubject
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.global(qos: .background))
            .sink { searchText in
                self.searchTask?.cancel()
                let task = Task {
                    guard let resultArray = await self.handleSearchText(searchText: searchText, sortType: self.sortType) else {
                        return
                    }
                    await self.updateResultArray(result: resultArray)
                }
                self.searchTask = task
            }
            .store(in: &bag)
    }

    private func handleSearchText(searchText: String, sortType: SortType) async -> [Suffix]? {
        return try? await withThrowingTaskGroup(of: [Suffix].self) { group in

            var resultArray = [Suffix]()
            let words = searchText.components(separatedBy: " ")
            words.forEach { word in
                group.addTask {
                    let result = word.lowercased().suffixArray(ascending: sortType == .ascending)
                    return result
                }
            }

            for try await task in group {
                resultArray.append(contentsOf: task)
            }
            return resultArray
        }
    }

    @MainActor
    private func updateResultArray(result: [Suffix]) {
        models = result
    }
}

