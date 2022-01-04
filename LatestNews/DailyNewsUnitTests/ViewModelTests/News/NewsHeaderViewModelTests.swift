//
//  NewsHeaderViewModelTests.swift
//  LatestNewsUnitTests
//
//  Created by Pooja on 3/1/22.
//

import XCTest
@testable import LatestNews

class NewsHeaderViewModelTests: XCTestCase {

    var service: MockNewsService!
    var viewModel: NewsHeaderViewModel!
    override func setUp() {
        service = MockNewsService()
        viewModel = NewsHeaderViewModel(service)
    }
    
    override func tearDown() {
        service = nil
        viewModel = nil
    }
    
    func testNewsHeaderViewModelFetchsNewsWhenInitialized() throws {
        
        //Given
        let news = try ResourceLoader.loadEverything(resource: .fetchNews2)
        service.eNews = news
        let presentationNews = news.articles.map {
            EverythingPresentation.init(everything: $0)
        }
                
        //When
        viewModel.loadPageTrigger.onNext(())
        
        //Then
        XCTAssertEqual(try viewModel.news.toBlocking().first(), presentationNews)
    }

}
