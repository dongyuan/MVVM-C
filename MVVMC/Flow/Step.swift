//
//  Step.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxFlow
import RxSwift

enum AppStep: Step {
    case onboarding
    case onboardingIsComplete
    case home

    case article
}
