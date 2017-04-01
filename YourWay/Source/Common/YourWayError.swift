//
//  YourWayError.swift
//  YourWay
//
//  Created by Valentin Popkov on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation

enum YourWayError: Error {
    
    enum ServerReason: String {
        case authFailed
    }
    
    case validation(fields: [String])
    case server(reason: ServerReason)
    
    static func validationError(for fields: [String]) -> YourWayError? {
        if fields.count == 0 {
            return nil
        }
        return self.validation(fields: fields)
    }
}

extension YourWayError: LocalizedError {
    public var errorDescription: String? {
        var description: String?
        switch self {
        case .validation(let fields):
            description = localizedString(for: "error-validation-\(fields.joined(separator: "-"))")
        case .server(let reason):
            description = localizedString(for: "error-server-\(reason.rawValue)")
        }
        return description
    }
    
    fileprivate func localizedString(for key: String) -> String? {
        let localizedDescription = NSLocalizedString(key, comment: "")
        if localizedDescription == key {
            return nil
        } else {
            return localizedDescription
        }
    }
}
