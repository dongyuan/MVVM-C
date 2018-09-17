//
//  ViewController.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action

final class OnboardingViewController: ViewController, BindableType {
    let userNameVariable = Variable<String>("")
    let passwordVariable = Variable<String>("")

    var viewModel: OnboardingViewModel!

    @IBOutlet private weak var userNameTextField: UITextField! {
        didSet {
            userNameTextField.rx.text.orEmpty.bind(to: userNameVariable).disposed(by: disposeBag)
        }
    }
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.rx.text.orEmpty.bind(to: passwordVariable).disposed(by: disposeBag)
        }
    }
    @IBOutlet private weak var authButton: UIButton!
    @IBOutlet private weak var skipButton: UIButton!

    func bindViewModel() {
        authButton.rx.action = viewModel.authAction
        skipButton.rx.action = viewModel.skipOnboardingAction
    }
}
