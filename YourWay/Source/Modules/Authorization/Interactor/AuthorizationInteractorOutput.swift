//
//  AuthorizationInteractorOutput.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import Foundation

protocol AuthorizationInteractorOutput: class {
    func authorizationCompleted()
    func errorOccured(_ error: Error)
}
