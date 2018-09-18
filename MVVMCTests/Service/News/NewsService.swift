//
//  NewsService.swift
//  MVVMCTests
//
//  Created by Eric Yuan on 18/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxSwift

@testable import MVVMC

struct NewsMockService: NewsServiceType {
    let response: NewsList?
    let error: Error?
    
    init(response: NewsList?, error: Error? = nil) {
        self.response = response
        self.error = error
    }
    
    func getTopHeadlines() -> Single<NewsList?> {
        if let error = error {
            return .error(error)
        } else {
            return .just(response)
        }
    }
}
