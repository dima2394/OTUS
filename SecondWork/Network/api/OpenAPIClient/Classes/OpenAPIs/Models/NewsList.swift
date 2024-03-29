//
// NewsList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct NewsList: Codable, JSONEncodable, Hashable {

    public var status: String?
    public var totalResults: Int?
    public var articles: [Article]?

    public init(status: String? = nil, totalResults: Int? = nil, articles: [Article]? = nil) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case totalResults
        case articles
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(totalResults, forKey: .totalResults)
        try container.encodeIfPresent(articles, forKey: .articles)
    }
}

