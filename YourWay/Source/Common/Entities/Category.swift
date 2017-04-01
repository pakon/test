//
//  Category.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    dynamic var title: String = ""
    
    dynamic var iconAssetName: String = ""
    
    convenience init(title: String,
                     iconAssetName: String) {
        self.init()
        self.title = title
        self.iconAssetName = iconAssetName
    }
}
