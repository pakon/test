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
    
    dynamic var order: Int = 1
    
    dynamic var stateRaw: Int = 3
    
    var state: StepState{
        get {
            return StepState(rawValue: stateRaw)!
        }
        set {
            stateRaw = newValue.rawValue
        }
    }
    
    convenience init(title: String,
                     order: Int,
                     state: StepState) {
        self.init()
        self.todayTitle = title
        self.order = order
        self.state = state
    }
    
}
