//
//  AppDelegate.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var coordinator = Coordinator()
    private let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startAppCoordinator()
        configureAppearance()
        return true
    }

    private func configureAppearance() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().prefersLargeTitles = true
    }

    private func startAppCoordinator() {
        coordinator.rx.didNavigate
            .subscribe(onNext: { flow, step in
                print ("did navigate to flow=\(flow) and step=\(step)")
            }).disposed(by: disposeBag)

        let appFlow = AppFlow(withWindow: window!)

        coordinator.coordinate(flow: appFlow, withStepper: AppStepper(withServices: AuthService()))
    }
}

