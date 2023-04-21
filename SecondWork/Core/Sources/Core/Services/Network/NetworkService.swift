//
//  NetworkService.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 27.02.2023.
//

import Foundation
import Network

public final class NetworkService: NetworkServiceProtocol {

    public init() {}

    public func fetchAllNews(query: String,
                             apiKey: String,
                             page: Int,
                             pageSize: Int,
                             language: String?,
                             completion: ((Result<NewsList, Error>) -> Void)?) {
        FetchNewsAPI.getAllNews(q: query,
                                apiKey: apiKey,
                                page: page,
                                pageSize: pageSize,
                                language: language,
                                apiResponseQueue: .main) { newsList, error in
            if let error {
                completion?(.failure(error))
                return
            }
            guard let newsList else {
                return
            }
            completion?(.success(newsList))
        }
    }
}
