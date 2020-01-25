//
//  URLRequest.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation


extension URLRequest {
    public enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
        case head = "HEAD"
        case options = "OPTIONS"
        case trace = "TRACE"
        case connect = "CONNECT"
    }
    
    public var method: HTTPMethod? {
        get {
            guard let httpMethod = self.httpMethod else { return nil }
            let method = HTTPMethod(rawValue: httpMethod)
            return method
        }
        set {
            self.httpMethod = newValue?.rawValue
        }
    }
}

extension URLRequest {
    public init(page: Int, url: String, method: HTTPMethod, body: [String: Any]?) {
        self.init(url: URL(string: url)!)
        self.timeoutInterval = 10.0
        self.method = method
        
        var components = URLComponents()
        
        components.scheme = APIScheme
        components.host   = APIHost
        components.path = "\(API_NEWS_LIST)mostviewed/all-sections/\(page).json"
        
        if let body = body {
            components.queryItems = [URLQueryItem]()
            for (key, value) in body {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        
        self.url = components.url
        
        print("Request URL Request \(self)")
        
    }
}
