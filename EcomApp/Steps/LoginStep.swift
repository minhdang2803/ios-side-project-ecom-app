//
//  LoginStep.swift
//  EcomApp
//
//  Created by Le Minh Dang on 22/4/26.
//

import RxFlow

enum LoginStep: Step {
    case loginIsRequired
    case registerIsRequired
    case isAuthenticatorFinished
}
