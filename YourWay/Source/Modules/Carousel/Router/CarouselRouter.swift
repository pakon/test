//
//  CarouselCarouselRouter.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

class CarouselRouter: CarouselRouterInput {
	
	weak var transitionHandler: ViperModuleTransitionHandler!
    
    func open(opportunity: Opportunity) {
        transitionHandler.openModule(with: CarouselConstants.SegueIdentifier.opportunity).thenChainUsingClosure { input in
            if let input = input as? OpportunityModuleInput {
                input.setup(opportunity: opportunity)
            }
            return nil
        }
    }
}
