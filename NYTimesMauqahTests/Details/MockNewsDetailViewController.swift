//
//  MockNewsDetailViewController.swift
//  NYTimesMauqahTests
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

@testable import NYTimesMauqah

class MockNewsDetailViewController {
    var presenter: NewsDetailsPresenterProtocol?
}
extension MockNewsDetailViewController : NewsDetailsViewProtocol {
    func setNavigationTitle(title: String) {
        
    }
    
    func setupNews(title: String, description: String) {
        
    }
    
    func loadImage(url: String) {
        
    }
    
    
}
