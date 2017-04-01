//
//  StepsDataManager.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import UIKit
import RealmSwift

protocol StepsDataManagerOutput {
    func received(steps: Results<Step>)
}

class StepsDataManager: NSObject {
    
    var output: StepsDataManagerOutput?
    
    // MARK: Public interface
    
    func getAllSteps() {
        let realm = try! Realm()
        let steps = realm.objects(Step.self).sorted(byKeyPath: "order", ascending: false)
        output?.received(steps: steps)
    }
    
}
