//
//  ResourceLoader.swift
//  LatestNewsUnitTests
//
//  Created by Pooja on 3/1/22.
//

import Foundation
@testable import LatestNews

class ResourceLoader {
    
    enum NewsResource: String {
        case fetchNews
        case fetchNews2
        case fetchTH
        case fetchTH2
        case fetchSources
        case fetchSources2
    }
    
    static func loadEverything(resource: NewsResource) throws -> ENewsModel {
        return try loadNews(resource: resource)
    }
    
    static func loadTH(resource: NewsResource) throws -> THNewsModel {
        return try loadNews(resource: resource)
    }
    
    static func loadSources(resource: NewsResource) throws -> Sources {
        return try loadNews(resource: resource)
    }
    
    static func loadNews<T: Decodable>(resource: NewsResource) throws -> T {
        
        let bundle = Bundle(for: ResourceLoader.self)
        let url = bundle.url(forResource: resource.rawValue, withExtension: "json")
        let data = try Data(contentsOf: url!)
        let decoder = JSONDecoder()
        let fetchNews = try decoder.decode(T.self, from: data)
        
        return fetchNews
    }
}
