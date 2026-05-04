//
//  MainFlow.swift
//  EcomApp
//
//  Created by Le Minh Dang on 6/4/26.
//
import UIKit
import RxFlow

class MainFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()
    func navigate(to step: any RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else { return.none }
        switch step {
        case .onboardingIsRequired:
            return navigateToOnboardingScreen()
        case .authenticatorIsRequired:
            return navigateToLoginScreen()
        }
    }

    private func navigateToOnboardingScreen () -> RxFlow.FlowContributors {
        let vm = OnboardingViewModel()
        let vc = OnboardingViewController()
        vc.viewModel = vm

        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }

    private func navigateToLoginScreen() -> RxFlow.FlowContributors {
        let loginFlow = LoginFlow(rootViewController: self.rootViewController)
        return .one(flowContributor: .contribute(
            withNextPresentable: loginFlow,
            withNextStepper: OneStepper(withSingleStep: LoginStep.loginIsRequired)
        ))
    }
}
