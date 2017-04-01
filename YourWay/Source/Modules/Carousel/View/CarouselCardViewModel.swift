//
//  CarouselCardViewModel.swift
//  YourWay
//
//  Created by Vasiliy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import Foundation

class CarouselCardViewModel {
    
    let image: UIImage
    let backgroundImage: UIImage
    let text: String
    
    init(image: UIImage, backgroundImage: UIImage, text: String) {
        self.image = image
        self.backgroundImage = backgroundImage
        self.text = text
    }
}
