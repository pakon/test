//
//  OpportunityOpportunityInitializer.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class OpportunityModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var opportunityViewController: OpportunityViewController!

    override func awakeFromNib() {

        let configurator = OpportunityModuleConfigurator()
        configurator.configureModuleForViewInput(opportunityViewController)
    }

}
