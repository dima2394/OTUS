//
// FetchNewsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class FetchNewsAPI {

    /**
     get all new
     
     - parameter q: (query)  
     - parameter apiKey: (query)  
     - parameter page: (query)  
     - parameter pageSize: (query)  
     - parameter language: (query)  (optional, default to "en")
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAllNews(q: String, apiKey: String = OpenAPIClientAPI.apiKey, page: Int, pageSize: Int, language: String? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: NewsList?, _ error: Error?) -> Void)) -> RequestTask {
        return getAllNewsWithRequestBuilder(q: q, apiKey: apiKey, page: page, pageSize: pageSize, language: language).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     get all new
     - GET /everything
     - Get All News
     - parameter q: (query)  
     - parameter apiKey: (query)  
     - parameter page: (query)  
     - parameter pageSize: (query)  
     - parameter language: (query)  (optional, default to "en")
     - returns: RequestBuilder<NewsList> 
     */
    open class func getAllNewsWithRequestBuilder(q: String, apiKey: String, page: Int, pageSize: Int, language: String? = nil) -> RequestBuilder<NewsList> {
        let localVariablePath = "/everything"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": (wrappedValue: q.encodeToJSON(), isExplode: true),
            "apiKey": (wrappedValue: apiKey.encodeToJSON(), isExplode: true),
            "page": (wrappedValue: page.encodeToJSON(), isExplode: true),
            "pageSize": (wrappedValue: pageSize.encodeToJSON(), isExplode: true),
            "language": (wrappedValue: language?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<NewsList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
