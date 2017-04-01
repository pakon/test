//
//  AuthorizationPresenter.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import Foundation

class AuthorizationPresenter {

    // MARK: - Variables
    weak var view: AuthorizationViewInput!
    var interactor: AuthorizationInteractorInput!
    var router: AuthorizationRouterInput!

    // MARK: - Private
    fileprivate var login: String = ""
    fileprivate var password: String = ""
    fileprivate var keyboardHeight: Double = 0
}

// MARK: - AuthorizationModuleInput

extension AuthorizationPresenter: AuthorizationModuleInput {
    
}

// MARK: - AuthorizationViewOutput
    
extension AuthorizationPresenter: AuthorizationViewOutput {
    func viewDidLoad() {
        view.setupInitialState()
    }

    func viewWillAppear() {
        view.setupStateForViewWillAppear()
    }

    func viewWillDisappear() {
        view.setupStateForViewWillDisappear()
    }
    
    func logInButtonDidTap() {
        view.hideKeyboard()
        view.clearError()
        interactor.authorize(withLogin: login, password: password)
    }
    
    func loginEntered(_ login: String) {
        self.login = login
    }
    
    func passwordEntered(_ password: String) {
        self.password = password
    }
    
    func keyboardHeightChanged(_ height: Double, withAnimationDuration animationDuration: Double, animationCurve: UInt) {
        if keyboardHeight == height {
            return
        }
        keyboardHeight = height
        view.adjustViewForKeyboardHeight(height, withAnimationDuration: animationDuration, animationCurve: animationCurve)
    }
}

// MARK: - AuthorizationInteractorOutput

extension AuthorizationPresenter: AuthorizationInteractorOutput {
    func authorizationCompleted() {
        router.openTabBar()
    }
    
    func errorOccured(_ error: Error) {
        var loginError = true
        var passwordError = true
        if let error = error as? YourWayError {
            switch error {
            case .validation(let fields):
                loginError = fields.contains("login")
                passwordError = fields.contains("password")
            default:
                break
            }
        }
        view.showError(error.localizedDescription, forLogin: loginError, forPassword: passwordError)
    }
}
