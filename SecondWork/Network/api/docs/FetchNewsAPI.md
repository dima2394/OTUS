# FetchNewsAPI

All URIs are relative to *https://newsapi.org/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllNews**](FetchNewsAPI.md#getallnews) | **GET** /everything | get all new


# **getAllNews**
```swift
    open class func getAllNews(q: String, apiKey: String, page: Int, pageSize: Int, language: String? = nil, completion: @escaping (_ data: NewsList?, _ error: Error?) -> Void)
```

get all new

Get All News

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let q = "q_example" // String | 
let apiKey = "apiKey_example" // String |  (default to "8160581966824d818db22e92f800c6ee")
let page = 987 // Int | 
let pageSize = 987 // Int |  (default to 20)
let language = "language_example" // String |  (optional) (default to "en")

// get all new
FetchNewsAPI.getAllNews(q: q, apiKey: apiKey, page: page, pageSize: pageSize, language: language) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String** |  | 
 **apiKey** | **String** |  | [default to &quot;8160581966824d818db22e92f800c6ee&quot;]
 **page** | **Int** |  | 
 **pageSize** | **Int** |  | [default to 20]
 **language** | **String** |  | [optional] [default to &quot;en&quot;]

### Return type

[**NewsList**](NewsList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

