//
//  OpportunityViewModel.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation

class OpportunityViewModel {
    let backgroundUrl: URL
    let iconImage: UIImage?
    let title: String
    let description: String
    
    init(backgroundUrl: URL, iconImage: UIImage?, title: String, description: String) {
        self.backgroundUrl = backgroundUrl
        self.iconImage = iconImage
        self.title = title
        self.description = description
    }
    
    convenience init(opportunity: Opportunity) {
        self.init(backgroundUrl: URL(string: opportunity.backgroundURL)!,
                  iconImage: UIImage(named: opportunity.icon),
                  title: opportunity.title,
                  description: opportunity.desc)
    }
}
