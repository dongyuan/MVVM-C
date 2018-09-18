//
//  HomeViewModelTest.swift
//  MVVMCTests
//
//  Created by Eric Yuan on 18/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxTest
import RxSwift
import XCTest

@testable import MVVMC

final class HomeViewModelTest: XCTestCase {

    func testArticlesDriverWithInvalidResponseEmptyArticle() {
        // setup
        let newsService = NewsMockService(response: nil)
        let viewModel = HomeViewModel(newsService: newsService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(source: viewModel.articles.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 0)
    }

    func testArticlesDriverWithErrorResponseEmptyArticle() {
        // setup
        let error = NSError(domain:"", code:0, userInfo:nil)
        let newsService = NewsMockService(response: nil, error: error)
        let viewModel = HomeViewModel(newsService: newsService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(source: viewModel.articles.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 0)
    }

    func testArticlesDriverWithValidResponseValidArticles() {
        // setup
        let newsService = NewsMockService(response: testNewsList)
        let viewModel = HomeViewModel(newsService: newsService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(source: viewModel.articles.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 1)
    }
}
