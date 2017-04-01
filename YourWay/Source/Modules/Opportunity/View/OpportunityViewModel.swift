//
//  OpportunityViewModel.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation

class OpportunityViewModel {
    let backgroundImage: UIImage
    let iconImage: UIImage
    let title: String
    let description: String
    
    init(backgroundImage: UIImage, iconImage: UIImage, title: String, description: String) {
        self.backgroundImage = backgroundImage
        self.iconImage = iconImage
        self.title = title
        self.description = description
    }
}
