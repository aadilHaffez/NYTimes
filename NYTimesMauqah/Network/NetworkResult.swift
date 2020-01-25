//
//  NetworkResult.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

struct NetworkResult<T> {
    let successResponse: T?
    let failureResponse: Error?
    
    init(success: T) {
        successResponse = success
        failureResponse = nil
    }
    
    init(failure: Error) {
        successResponse = nil
        failureResponse = failure
    }
}
