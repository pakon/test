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
    let backgroundImage: UIImage?
    let iconImage: UIImage?
    let title: String
    let description: String
    
    init(backgroundUrl: URL, backgroundImage: UIImage?, iconImage: UIImage?, title: String, description: String) {
        self.backgroundUrl = backgroundUrl
        self.backgroundImage = backgroundImage
        self.iconImage = iconImage
        self.title = title
        self.description = description
    }
    
    convenience init(opportunity: Opportunity, backgroundImage: UIImage?) {
        let image: UIImage? = opportunity.category == nil ? nil : UIImage(named: opportunity.category!.iconAssetName)
        self.init(backgroundUrl: URL(string: opportunity.backgroundURL)!,
                  backgroundImage: backgroundImage,
                  iconImage: image,
                  title: opportunity.title,
                  description: opportunity.desc)
    }
}
