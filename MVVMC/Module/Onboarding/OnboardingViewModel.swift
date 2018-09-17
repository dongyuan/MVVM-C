//
//  File.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//
import RxSwift
import Action

final class OnboardingViewModel: ViewModel {
    var authAction: CocoaAction!
    var skipOnboardingAction: CocoaAction!

    init(
        input: (
        userName: Variable<String>,
        password: Variable<String>),
        authService: AuthService) {
        super.init()
        let isValidCredential = Observable.combineLatest(input.userName.asObservable(),
                                                         input.password.asObservable()) { userName, password in
                                                            !userName.isEmpty && !password.isEmpty}

        authAction = CocoaAction(enabledIf: isValidCredential) { [unowned self] _ in
            return authService.authorise(username: input.userName.value, password: input.password.value)
                .do(onSuccess: {[unowned self] isAuthorised in
                    if isAuthorised {
                        self.step.accept(AppStep.onboardingIsComplete)
                    }
                }).map {_ in ()}
        }

        skipOnboardingAction = CocoaAction() { [unowned self] _ in
            self.step.accept(AppStep.onboardingIsComplete)
            return .empty()
        }
    }
}
