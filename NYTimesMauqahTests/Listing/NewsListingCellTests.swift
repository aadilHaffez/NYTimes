//
//  NewsListingCellTests.swift
//  NYTimesMauqahTests
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import XCTest

@testable import NYTimesMauqah

class NewsListingCellTests : XCTestCase {
    
    func testControllerHasTableView() {
        guard let controller = UIStoryboard(name: "News", bundle: nil).instantiateInitialViewController() as? NewsListingViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }

        controller.loadViewIfNeeded()

        XCTAssertNotNil(controller.tableview_news_listing,
                        "Controller should have a tableview")
    }
    
    
    func testTableViewDataSourceIsNewsListingViewController() {
        guard let controller = UIStoryboard(name: "News", bundle: nil).instantiateInitialViewController() as? NewsListingViewController else {
            return XCTFail("Could not instantiate ViewController from News storyboard")
        }

        controller.loadViewIfNeeded()

        XCTAssertTrue(controller.tableview_news_listing.dataSource is NewsListingViewController,
                      "TableView's data source should be a NewsListingViewController")
    }
    
}

