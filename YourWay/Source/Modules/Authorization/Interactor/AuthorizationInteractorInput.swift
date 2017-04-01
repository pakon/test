//
//  AuthorizationInteractorInput.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import Foundation

protocol AuthorizationInteractorInput {
    func authorize(withLogin login: String, password: String)
}
