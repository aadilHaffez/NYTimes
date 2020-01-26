//
//  MockNewsListingInteractor.swift
//  NYTimesTests
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
@testable import NYTimes

class MockNewsListingInteractor: NewsListingInteractorInputProtocol {
    var presenter: NewsListingInteractorOutputProtocol?
    
    func fetchNews(page: Int) {
        
        let result = JSONManager.getNewsData()
        switch result {
            
        case .Success(let data):
            do {
                guard let _ = try JSONSerialization.jsonObject(with: data,
                                                               options: []) as? [String: Any] else {
                                                                print("Could not get JSON from responseData as dictionary")
                                                                return
                }
                
                guard let result = try? JSONDecoder().decode(Results.self, from: data) else {
                    print("Failed")
                    //self.presenter?.error(error: Error)
                    return
                }
                
                self.presenter?.fetchNews(result: result)
                
                
            }catch (let error){
                self.presenter?.showError(error: error)
            }
        case .Failure(let error):
            print(error.localizedDescription)
        }
    }
}
