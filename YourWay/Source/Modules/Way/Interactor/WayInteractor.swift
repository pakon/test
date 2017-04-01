//
//  WayWayInteractor.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import RealmSwift

class WayInteractor: WayInteractorInput, StepsDataManagerOutput {

    weak var output: WayInteractorOutput!
    weak var stepsDataManager: StepsDataManager!
    
    // MARK: WayInteractorInput
    
    func obtainSteps() {
        stepsDataManager.getAllSteps()
    }
    
    // MARK: StepsDataManagerOutput
    
    func received(steps: Results<Step>) {
        output.received(steps: Array(steps))
    }
    
}
