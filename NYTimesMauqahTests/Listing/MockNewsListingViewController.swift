//
//  MockNewsListingViewController.swift
//  NYTimesMauqahTests
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
@testable import NYTimesMauqah

class MockNewsListingViewController {
    var presenter: NewsListingPresenterProtocol?

}

extension MockNewsListingViewController : NewsListingViewProtocol {
    func showLoader() {
        ///
    }
    
    func hideLoader() {
        ///
    }
    
    func refreshView() {
        ///
    }
    
    func showError(error: Error) {
        ///
    }
}
