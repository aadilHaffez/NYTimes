//
//  NewsListingInteractor.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

class NewsListingInteractor : NewsListingInteractorInputProtocol {
   weak var presenter: NewsListingInteractorOutputProtocol?
    
    
    //API Session
    static let sharedWebClient = WebClient(baseURL: API_NEWS_LIST)
    var loginTask: URLSessionDataTask!
    
    func fetchNews(page: Int) {
        let parameters : [String : Any] = [
            "api-key": API_KEY]
        
        let url_string = "\(API_NEWS_LIST)mostviewed/all-sections/1.json"
        let get_news = URLRequest(page: page,
                                  url: url_string,
                                  method: URLRequest.HTTPMethod.get,
                                  body: parameters)
        
        loginTask = NewsListingInteractor.sharedWebClient.dataTask(get_news) {[weak self] response in
            print("Response is \(response)")
            DispatchQueue.main.async {
                guard let data = response.successResponse?.data else {
                    print("Error: did not receive data")
                    return
                }
                
                self?.parseNews(data: data)
            }
        }
    }
    
    private func parseNews(data: Data) {
            // parse the result as JSON, since that's what the API provides
            do {
                guard let _ = try JSONSerialization.jsonObject(with: data,
                                                               options: []) as? [String: Any] else {
                                                                print("Could not get JSON from responseData as dictionary")
                                                                return
                }
                
                guard let result = try? JSONDecoder().decode(Results.self, from: data) else {
                    print("Failed")
                   // self.presenter?.error(error: Error)
                    return
                }
                
                self.presenter?.fetchNews(result: result)
            }catch  {
                print("error parsing response from POST on /todos")
                return
            }
        }
}
