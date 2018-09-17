//
//  TestUtility.swift
//  MVVMCTests
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import RxTest
import RxSwift
import RxFlow

@testable import MVVMC

extension TestScheduler {
    /**
     Builds testable observer for specific observable sequence, binds it's results and sets up disposal.
     
     - parameter source: Observable sequence to observe.
     - returns: Observer that records all events for observable sequence.
     */
    func record<O: ObservableConvertibleType>(source: O) -> TestableObserver<O.E> {
        let observer = createObserver(O.E.self)
        let disposable = source.asObservable().bind(to: observer)
        scheduleAt(100000) {
            disposable.dispose()
        }
        return observer
    }
    
    func record(stepper: Stepper) -> TestableObserver<AppStep>{
        return record(source: stepper.step.flatMap{step -> Observable<AppStep> in
            if let step = step as? AppStep {
                return .just(step)
            } else {
                return .empty()
            }
        })
    }
}
