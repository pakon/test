//
//  AuthorizationInitializer.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class AuthorizationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var authorizationViewController: AuthorizationViewController!

    override func awakeFromNib() {

        let configurator = AuthorizationModuleConfigurator()
        configurator.configureModuleForViewInput(authorizationViewController)
    }

}
