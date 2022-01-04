//
//  NewsViewModelTests.swift
//  LatestNewsUnitTests
//
//  Created by Pooja on 3/1/22.
//

import XCTest
import RxBlocking
import RxSwift

@testable import LatestNews

class NewsViewModelTests: XCTestCase {
    
    var service: MockNewsService!
    var viewModel: NewsViewModel!
    
    override func setUp() {
        service = MockNewsService()
        viewModel = NewsViewModel(service)
    }
    
    override func tearDown() {
        service = nil
        viewModel = nil
    }
    
    func testViewModelFetchDataWhenInitialized() throws {
        
        //Given
        let news = try ResourceLoader.loadEverything(resource: .fetchNews)
        service.eNews = news
        let presentationNews = news.articles.map {
            new in EverythingPresentation(everything: new)
        }
        //When
        viewModel.loadPageTrigger.onNext(())
        
        
        //Then
        XCTAssertEqual(try viewModel.news.toBlocking().first(), presentationNews)
    }
    
    func testViewModelLoadNextPageWhenPageScrolledDown() throws {
        
        //Given
        let page = 3
        let news = try ResourceLoader.loadEverything(resource: .fetchNews)
        service.eNews = news
        var presentationNews = news.articles.map {
            new in EverythingPresentation(everything: new)
        }
        presentationNews.append(contentsOf: presentationNews)

        
        //When
        viewModel.loadPageTrigger.onNext(())
        viewModel.loadNextPageTrigger.onNext(())
        
        //Then
        XCTAssertEqual(viewModel.page, page)
        XCTAssertEqual(try viewModel.news.toBlocking().first(), presentationNews)
    }
}
