//
//  HomeFlow.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxFlow
import RxSwift

final class OnboardingFlow: Flow {

    var root: Presentable {
        return rootViewController
    }

    private let rootViewController = UINavigationController()

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .onboarding:
            return navigateToHomeScreen()
        case .onboardingIsComplete:
            return .end(withStepForParentFlow: AppStep.onboardingIsComplete)
        default:
            return .none
        }
    }

    private func navigateToHomeScreen() -> NextFlowItems {
        let viewController = R.storyboard.onboarding.onboardingViewController()!
        let viewModel = OnboardingViewModel(input: (userName: viewController.userNameVariable, password: viewController.passwordVariable), authService: AuthService())
        viewController.bind(viewModel: viewModel)
        rootViewController.setViewControllers([viewController], animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
}

