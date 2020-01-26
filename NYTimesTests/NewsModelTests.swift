//
//  NewsModelTests.swift
//  NYTimesTests
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import XCTest

@testable import NYTimes

class NewsModelTests : XCTestCase {
    
    func testIfAPISchemaIsSet(){
        XCTAssert(APIScheme == "https")
    }
    
    func testIfAPIHostIsSet(){
        XCTAssert(APIHost == "api.nytimes.com")
    }
    func testIfAPIKeyIsSet(){
        XCTAssert(API_KEY == "dz2bFeJ5GPT8ANWGEkQtoq5slr2tmpqG")
    }
}
