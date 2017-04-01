//
//  Step.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation
import RealmSwift

class Step: Object {

    dynamic var todayTitle: String = ""
    
    let opportunities: List<Opportunity> = List()
    
    dynamic var date: Date = Date()
    
    dynamic var typeRaw: Int = 3
    
    var type: StepType {
        get {
            return StepType(rawValue: typeRaw)!
        }
        set {
            typeRaw = newValue.rawValue
        }
    }
}
