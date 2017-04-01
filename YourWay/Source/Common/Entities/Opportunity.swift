//
//  Opportunity.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation
import RealmSwift

class Opportunity: Object {

    dynamic var title: String = ""
    
    dynamic var backgroundURL: String = ""
    
    dynamic var desc: String = ""
    
    dynamic var category: Category? = nil
    
    convenience init(title: String,
                     backgroundURL: String,
                     desc: String,
                     category: Category) {
        self.init()
        self.title = title
        self.backgroundURL = backgroundURL
        self.desc = desc
        self.category = category
    }
}
