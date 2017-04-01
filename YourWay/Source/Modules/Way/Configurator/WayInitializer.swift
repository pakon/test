//
//  WayWayInitializer.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class WayModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var wayViewController: WayViewController!

    override func awakeFromNib() {

        let configurator = WayModuleConfigurator()
        configurator.configureModuleForViewInput(wayViewController)
    }

}
