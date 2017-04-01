//
//  OpportunityOpportunityModuleInput.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

protocol OpportunityModuleInput: ViperModuleInput {
    func setup(opportunity: Opportunity, backgroundImage: UIImage?)
}
