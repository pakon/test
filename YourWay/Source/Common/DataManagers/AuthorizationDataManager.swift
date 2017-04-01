//
//  AuthorizationDataManager.swift
//  YourWay
//
//  Created by Valentin Popkov on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

class AuthorizationDataManager {
    func authorize(withLogin login: String, password: String, completion: ((Error?) -> ())?) {
        if login.lowercased() == "pavel" && password == "password" {
            completion?(nil)
            return
        }
        let error = YourWayError.server(reason: .authFailed)
        completion?(error)
    }
}
