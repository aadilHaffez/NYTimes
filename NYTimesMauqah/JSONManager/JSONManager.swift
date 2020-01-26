//
//  JSONManager.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
enum CustomError : LocalizedError {
    case error(message:String)
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}
enum NewsResult {
    case Success(Data)
    case Failure(Error)
}
struct JSONManager {
    
    static func getNewsData() -> NewsResult {
        return readData(from: "news")
    }
    
    private static func readData(from file:String) -> NewsResult {
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return .Success(data)
            } catch (let ex){
                return .Failure(ex)
            }
        }else{
            return .Failure(CustomError.error(message: "JSON file not found"))
        }
    }
}
