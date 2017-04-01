//
//  AuthorizationViewOutput.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

protocol AuthorizationViewOutput {

    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    
    func logInButtonDidTap()
    func loginEntered(_ login: String)
    func passwordEntered(_ password: String)
    
    func keyboardHeightChanged(_ height: Double, withAnimationDuration animationDuration: Double, animationCurve: UInt)
}
