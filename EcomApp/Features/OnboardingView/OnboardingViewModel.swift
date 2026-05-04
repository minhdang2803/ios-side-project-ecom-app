//
//  OnboardingViewModel.swift
//  EcomApp
//
//  Created by Le Minh Dang on 6/4/26.
//

import RxFlow
import RxRelay
import RxSwift

class OnboardingViewModel: Stepper {
    let steps = PublishRelay<Step>()
    func goToOnboarding() {
        // Phát lệnh để Coordinator biết cần chuyển màn hình
        self.steps.accept(AppStep.onboardingIsRequired)
    }

    func goToLoginPage() {
        self.steps.accept(AppStep.authenticatorIsRequired)
    }

}
