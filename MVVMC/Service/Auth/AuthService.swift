//
//  AuthService.swift
//  MVVMC
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//
import RxSwift

protocol AuthServiceType {
    var isAuthorised: Bool { get }
    func authorise(username: String, password: String) -> Single<Bool>
}

struct AuthService: AuthServiceType {
    var isAuthorised: Bool {
        return false
    }

    func authorise(username: String, password: String) -> Single<Bool> {
        return .just(true)
    }
}
