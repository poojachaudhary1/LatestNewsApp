//
//  NewsServiceTests.swift
//  LatestNewsUnitTests
//
//  Created by Pooja on 4/1/22.
//

import XCTest

@testable import LatestNews

class NewsServiceTests: XCTestCase {

    func testParsing() throws {
        let bundle = Bundle(for: NewsServiceTests.self)
        let url = bundle.url(forResource: "fetchNews", withExtension: "json")
        let data = try Data(contentsOf: url!)
        let decoder = JSONDecoder()
        let fetchNews = try decoder.decode(ENewsModel.self, from: data)
        
        XCTAssertEqual(fetchNews.status, "ok")
        XCTAssertEqual(fetchNews.totalResults, 3322)
        XCTAssertEqual(fetchNews.articles.count, 2)
        XCTAssertEqual(fetchNews.articles[0].author, "Tasnim News Agency")
        
    }
    
}
