//
//  AuthorizationInteractor.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

class AuthorizationInteractor: AuthorizationInteractorInput {

    weak var output: AuthorizationInteractorOutput!
    var authorizationDataManager: AuthorizationDataManager!
    
    func authorize(withLogin login: String, password: String) {
        if let error = validate(login: login, password: password) {
            output.errorOccured(error)
            return
        }
        
        authorizationDataManager.authorize(withLogin: login, password: password) { error in
            if let error = error {
                self.output.errorOccured(error)
            } else {
                self.output.authorizationCompleted()
            }
        }
    }
    
    private func validate(login: String, password: String) -> Error? {
        var fields: [String] = []
        if login.characters.count < 5 {
            fields.append("login")
        }
        if password.characters.count < 5 {
            fields.append("password")
        }
        let error = YourWayError.validationError(for: fields)
        return error
    }
}
