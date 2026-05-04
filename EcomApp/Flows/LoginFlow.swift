//
//  LoginFlow.swift
//  EcomApp
//
//  Created by Le Minh Dang on 22/4/26.
//

import UIKit
import RxFlow

class LoginFlow: Flow {

    var root: any Presentable {
        self.rootViewController
    }

    private let rootViewController: UIViewController

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func navigate(to step: any RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? LoginStep else { return.none }
        switch step {
        case .loginIsRequired:
            return navigateToLoginScreen()
        case .registerIsRequired:
            return navigateToRegisterScreen()
        case .isAuthenticatorFinished:
            return backToTheOnboardingScreen()
        }
    }

    private func navigateToLoginScreen() -> RxFlow.FlowContributors {
        let vm = LoginViewModel()
        let vc = LoginViewController(viewModel: vm)

        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .pageSheet

        self.rootViewController.present(navVC, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }

    private func navigateToRegisterScreen() -> RxFlow.FlowContributors {
        let vm = LoginViewModel()
        let vc = LoginViewController(viewModel: vm)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }

    private func backToTheOnboardingScreen() -> RxFlow.FlowContributors {
        self.rootViewController.dismiss(animated: true, completion: nil)
        return .none
    }
}

