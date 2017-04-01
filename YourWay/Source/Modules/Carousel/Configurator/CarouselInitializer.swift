//
//  CarouselCarouselInitializer.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class CarouselModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var carouselViewController: CarouselViewController!

    override func awakeFromNib() {

        let configurator = CarouselModuleConfigurator()
        configurator.configureModuleForViewInput(carouselViewController)
    }

}
