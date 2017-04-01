//
//  AuthorizationViewInput.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

protocol AuthorizationViewInput: class {

    func setupInitialState()
    func setupStateForViewWillAppear()
    func setupStateForViewWillDisappear()
    
    func showLogInButton()
    func hideLogInButton()
    
    func showError(_ error: String, forLogin: Bool, forPassword: Bool)
    func clearError()
    
    func adjustViewForKeyboardHeight(_ height: Double, withAnimationDuration animationDuration: Double, animationCurve: UInt)
    func hideKeyboard()
}
