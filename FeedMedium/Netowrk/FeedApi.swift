//
//  FeedApi.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/20/22.
//

import Foundation

protocol FeedApi {
    func getFeed(_ url: String, _ offset: Int, _ count: Int, completion:([Model]?, Error?)->())
}
protocol HttpClient {
    func get(string: String, completion:(Data?, Error?)->())
}
protocol CacheStore {
    func insert(_ model:Model)
    func retrieve(_ url: String, _ offset: Int, _ count: Int)
    func purgeCache()
}

class RemoteFeedApi : FeedApi {
    
    let client : HttpClient
    init(_ cl: HttpClient) {
        client = cl
    }
    
    func getFeed(_ url: String, _ offset: Int, _ count: Int, completion: ([Model]?, Error?) -> ()) {
        client.get(string: url) { data, error in
            if error == nil {
              let models = [Model]()  // map data to model
                completion(models,nil)
            }
        }
    }
}
class CacheFeedApi : FeedApi {
    let cacheStore : CacheStore
    
    init(_ cache: CacheStore) {
        cacheStore = cache
    }
    
    func getFeed(_ url: String, _ offset: Int, _ count: Int, completion: ([Model]?, Error?) -> ()) {
        fatalError("Unimplemented")
    }
}

class UrlSessionClient: HttpClient {
    let urlSession = URLSession.shared
    func get(string: String, completion: (Data?, Error?) -> ()) {
        fatalError()
    }
}

class CoreDataClient : CacheStore {
    // implement core data dependencies
    func insert(_ model: Model) {
        fatalError()
    }
    
    func retrieve(_ url: String, _ offset: Int, _ count: Int) {
        fatalError()
    }
    
    func purgeCache() {
        fatalError()
    }
    
    
}

class PrimaryWithFallBack : FeedApi {
    var primary : FeedApi
    var secondary: FeedApi
    init(_ primary: FeedApi, _ secondary: FeedApi) {
        self.primary = primary
        self.secondary = secondary
    }
    // business logic: try to access remote resource and fall back on cache if failed
    func getFeed(_ url: String, _ offset: Int, _ count: Int, completion: ([Model]?, Error?) -> ()) {
        // try access remote resouce
        primary.getFeed(url, offset, count, completion: { model, responseError in
            if responseError != nil {
                // fallback on secondary resource (Cache)
                secondary.getFeed(url, offset, count) { secondaryModel, secondaryResponseError in
                    if secondaryResponseError != nil {
                        completion(secondaryModel,nil)
                    }
                }
                
            } else {
                completion(model,nil)
            }
        })
    }
}

struct Model {
    
}
