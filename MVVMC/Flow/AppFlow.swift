//
//  AppFlow.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import UIKit
import RxFlow

final class AppFlow: Flow {
    var root: Presentable {
        return window
    }

    private let window: UIWindow

    init(withWindow window: UIWindow) {
        self.window = window
    }

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .onboarding:
            return navigateToOnboardingFlow()
        case .onboardingIsComplete, .home:
            return navigateToHomeFlow()
        default:
            return .none
        }
    }

    private func navigateToOnboardingFlow() -> NextFlowItems {
        let flow = OnboardingFlow()
        Flows.whenReady(flow1: flow) { [unowned self] root in self.window.rootViewController = root }
        return .one(flowItem: NextFlowItem(nextPresentable: flow, nextStepper: OneStepper(withSingleStep: AppStep.onboarding)))
    }

    private func navigateToHomeFlow() -> NextFlowItems {
        let flow = HomeFlow()
        Flows.whenReady(flow1: flow) { [unowned self] root in self.window.rootViewController = root }
        return .one(flowItem: NextFlowItem(nextPresentable: flow, nextStepper: OneStepper(withSingleStep: AppStep.home)))
    }
}

final class AppStepper: Stepper {
    private let authService: AuthService

    init(withServices authService: AuthService) {
        self.authService = authService
        dertermineFirstStep()
    }

    private func dertermineFirstStep() {
        step.accept(authService.isAuthorised ? AppStep.home: AppStep.onboarding)
    }
}
