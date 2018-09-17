//
//  HomeFlow.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxFlow
import RxSwift

final class HomeFlow: Flow {

    var root: Presentable {
        return rootViewController
    }

    private let rootViewController = UINavigationController()

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .home:
            return navigateToHomeScreen()
        case .article:
            return navigateToHomeScreen()
        default:
            return .none
        }
    }

    private func navigateToHomeScreen() -> NextFlowItems {
        let viewController = R.storyboard.home.homeViewController()!
        let viewModel = HomeViewModel()
        viewController.bind(viewModel: viewModel)
        rootViewController.setViewControllers([viewController], animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: viewController, nextStepper: viewModel))
    }
}

