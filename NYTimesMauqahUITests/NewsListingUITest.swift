//
//  NewsListingUITest.swift
//  NYTimesMauqahUITests
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import XCTest

@testable import NYTimesMauqah

class NewsListingUITest: XCTestCase {

    var app: XCUIApplication!

    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

         app = XCUIApplication()
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
    
    func testNewsListingScrollUp() {
        app.gentleSwipe(0.5, .Up)
                app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
    }
    
    func testNewsListingScrollUpDown() {
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        app.gentleSwipe(0.5, .Up)
        
        app.gentleSwipe(0.5, .Down)
        app.gentleSwipe(0.5, .Down)
        app.gentleSwipe(0.5, .Down)
        app.gentleSwipe(0.5, .Down)
    }
    
    func testNewsListingScrollDown() {
        app.gentleSwipe(0.5, .Down)
        app.gentleSwipe(0.5, .Down)
        app.gentleSwipe(0.5, .Down)
        app.gentleSwipe(0.5, .Down)
    }
    
    func testDidSelectItemIndex0() {
        let myTable = app.tables.matching(identifier: "NewsTableViewIdentifier")
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_0")
        cell.tap()
        
        sleep(5)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    
    func testDidSelectItemIndex1() {
        let myTable = app.tables.matching(identifier: "NewsTableViewIdentifier")
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_1")
        cell.tap()
        
        sleep(5)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    
    func testDidSelectItemIndex2() {
        let myTable = app.tables.matching(identifier: "NewsTableViewIdentifier")
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_2")
        cell.tap()
        
        sleep(5)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    
   
}
