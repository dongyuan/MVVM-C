//
//  OnboardingViewModelTest.swift
//  MVVMCTests
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxTest
import RxSwift
import XCTest

@testable import MVVMC

final class OnboardingViewModelTest: XCTestCase {

    func testAuthActionWithInvalidCredentialIsDisabled() {
        // setup
        let userName = Variable<String>("")
        let password = Variable<String>("")
        let authService = AuthService()
        let viewModel = OnboardingViewModel(input: (userName: userName, password: password), authService: authService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(source: viewModel.authAction.enabled)

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.last?.value.element, false)
    }

    func testAuthActionWithValidCredentialIsEnabled() {
        // setup
        let userName = Variable<String>("valid@email.com")
        let password = Variable<String>("validPassword")
        let authService = AuthService()
        let viewModel = OnboardingViewModel(input: (userName: userName, password: password), authService: authService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(source: viewModel.authAction.enabled)

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.last?.value.element, true)
    }

    func testAuthActionExecutedWithValidCredentialNavigteOnboardingComplete() {
        // setup
        let userName = Variable<String>("valid@email.com")
        let password = Variable<String>("validPassword")
        let authService = AuthService()
        let viewModel = OnboardingViewModel(input: (userName: userName, password: password), authService: authService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(stepper: viewModel)

        scheduler.scheduleAt(10) { viewModel.authAction.execute(()) }

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.last?.value.element, AppStep.onboardingIsComplete)
    }

    func testSkipOnboardingActionExecutedNavigteOnboardingComplete() {
        // setup
        let userName = Variable<String>("valid@email.com")
        let password = Variable<String>("validPassword")
        let authService = AuthService()
        let viewModel = OnboardingViewModel(input: (userName: userName, password: password), authService: authService)

        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.record(stepper: viewModel)

        scheduler.scheduleAt(10) { viewModel.skipOnboardingAction.execute(()) }

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.last?.value.element, AppStep.onboardingIsComplete)
    }
}
