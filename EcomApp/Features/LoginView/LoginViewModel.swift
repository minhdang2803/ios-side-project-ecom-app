//
//  LoginViewModel.swift
//  EcomApp
//
//  Created by Le Minh Dang on 22/4/26.
//

import RxFlow
import RxRelay
import RxSwift

class LoginViewModel : Stepper {
    let steps = PublishRelay<Step>()
    
    
    struct Input {
        
    }
    
    
    func onBack(){
        self.steps.accept(LoginStep.isAuthenticatorFinished)
    }
    
    func onLoginWithGoogle(){
        
    }
    
    func onLoginWithFacebook(){
        
    }
}
