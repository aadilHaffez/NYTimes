//
//  NewsListingTests.swift
//  NYTimesTests
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import XCTest
@testable import NYTimes

class NewsListingTests: XCTestCase {

    var interface =  MockNewsListingViewController()
    var router = MockNewsListingRouter()
    var interactor = MockNewsListingInteractor()
    var presenter : NewsListingPresenter?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        presenter = NewsListingPresenter.init(interface: interface,
                                              interactor: interactor,
                                              router: router)
        interactor.presenter = presenter
        interface.presenter = presenter
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testJSONManager(){
        let manager = JSONManager.getNewsData()
        switch manager {
        case .Success(let data):
            XCTAssertNotNil(data)
            break
        case .Failure( _):
            XCTFail()
            break
        }
    
        
    }
    func testNewsCountShouldBeGreaterThanZero() {
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
        guard let result = presenter?.result else { fatalError("News are nil") }
        guard let results = result.results else { fatalError("News are nil") }
        let count = results.count
        XCTAssert(count > 0, "Count is zero")
    }
    
    func testAllNewsItemsHasTitle() {
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
        guard let result = presenter?.result else { fatalError("News are nil") }
        guard let results = result.results else { fatalError("News are nil") }
        for value in results {
            guard let title = value.title else { fatalError("Title is nil") }
            XCTAssert(title.count > 0, "Title is empty")
        }
    }
    
    func testAllNewsItemsHasDescription() {
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
        guard let result = presenter?.result else { fatalError("News are nil") }
        guard let results = result.results else { fatalError("News are nil") }
        for value in results {
            guard let abstract = value.abstract else { fatalError("Title is nil") }
            XCTAssert(abstract.count > 0, "Abstract is empty")
        }
    }
    
    func testAllNewsItemsHasPublishedDate() {
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
        guard let result = presenter?.result else { fatalError("News are nil") }
        guard let results = result.results else { fatalError("News are nil") }
        for value in results {
            guard let publishedDate = value.publishedDate else { fatalError("Title is nil") }
            XCTAssert(publishedDate.count > 0, "Published Date is empty")
        }
    }
    
    func testCellImageViewURL() {
        let expected = expectation(description: "Image from https did load")
        
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
        guard let result = presenter?.result else { fatalError("News are nil") }
        guard let results = result.results else { fatalError("News are nil") }

        let newsImage = UIImageView()
        
        
        if let media = results[0].media,
            media.count > 0 {
            let mediaObj = media[0]
            
            if let mediaMetadata = mediaObj.mediaMetadata,
                mediaMetadata.count > 0 {
                let url = mediaMetadata[0]
                if let url = url.url  {
                    newsImage.downloaded(from: url,contentMode: .scaleAspectFill, completion: {
                        if newsImage.image != nil {
                            expected.fulfill()
                        } else {
                            XCTFail()
                        }
                    })
                }
            }
        }
        waitForExpectations(timeout: 10.0, handler: nil)
    }

    func testFetchDataShouldFail(){
        NetworkManager.shared.isInternetConnected = false
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
    }
    
    func testShouldShowAPIError(){
        
        
        presenter?.viewDidLoad()
        presenter?.startFetchingNews(page: 0)
    }
}
