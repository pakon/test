//
//  CarouselCardViewModel.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation

class CarouselCardViewModel {
    
    let imageUrl: URL
    let text: String
    let priority: Float
    
    var backgroundImage: UIImage?
    
    init(imageUrl: URL, text: String, priority: Float) {
        self.imageUrl = imageUrl
        self.text = text
        self.priority = priority
    }
    
    convenience init?(opportunity: Opportunity, priority: Float = 1) {
        guard let url = URL(string: opportunity.backgroundURL) else {
            return nil
        }
        self.init(imageUrl: url, text: opportunity.title, priority: priority)
    }
}
