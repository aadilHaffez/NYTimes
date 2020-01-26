//
//  NewsDetailTests.swift
//  NYTimesMauqahTests
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import XCTest

@testable import NYTimesMauqah

class NewsDetailTests : XCTestCase {
    var interface =  MockNewsDetailViewController()
       var router = MockNewsDetailRouter()
       var interactor = MockNewsDetailInteractor()
       var presenter : NewsDetailPresenter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        presenter = NewsDetailPresenter.init(interface: interface, interactor: interactor, router: router)
       
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
    func testNewsIsNotEqualToNil() {
        presenter?.viewDidLoad()
        presenter?.news  = News(title: "", abstract: "", media: nil)
       // presenter?.startFetchingNews(page: 0)
        
        XCTAssert(presenter?.news != nil, "news Not Nil")
    }
    
    func testNewsTitleIsNotEqualToNilOrEpmty() {
        presenter?.viewDidLoad()
        presenter?.news  = News(title : "News")
       // presenter?.startFetchingNews(page: 0)
        
        XCTAssert(presenter?.news?.title != nil, "Title is Nil")
        XCTAssert(presenter?.news?.title?.count ?? 0 > 0, "Title is empty")
        
    }
    
    func testNewsAbstractIsNotEqualToNilOrEpmty() {
        presenter?.viewDidLoad()
        presenter?.news  = News(abstract: "Sub")
       // presenter?.startFetchingNews(page: 0)
        
        XCTAssert(presenter?.news?.abstract != nil, "Abstract is Nil")
        XCTAssert(presenter?.news?.abstract?.count ?? 0 > 0, "Abstract is empty")
        
    }
    
    
    func testNewsMediaIsNotEqualToNilOrEpmty() {
        presenter?.viewDidLoad()
        
        let metaData : [MediaMetadatum] = [MediaMetadatum(url: "https://", format: nil, height: 0, width: 0)]
        
        let media  = [Media(type: nil, subType: nil, caption: nil, copyright: nil, approvedForSyndication: nil, mediaMetadata: metaData)]
        presenter?.news = News(media: media)
       // presenter?.startFetchingNews(page: 0)
        
        XCTAssert(presenter?.news?.media?[0].mediaMetadata?[0].url != nil, "Abstract is Nil")
        XCTAssert(presenter?.news?.media?[0].mediaMetadata?[0].url?.count ?? 0 > 0, "Abstract is empty")
        
    }
}
