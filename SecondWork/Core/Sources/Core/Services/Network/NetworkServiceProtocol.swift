//
//  NetworkServiceProtocol.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 27.02.2023.
//

import Foundation
import Network

public protocol NetworkServiceProtocol {

    func fetchAllNews(query: String,
                      apiKey: String,
                      page: Int,
                      pageSize: Int,
                      language: String?,
                      completion: ((Result<NewsList, Error>) -> Void)?)
}
