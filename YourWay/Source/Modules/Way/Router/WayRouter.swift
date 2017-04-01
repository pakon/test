//
//  WayWayRouter.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

class WayRouter: WayRouterInput {
	
	weak var transitionHandler: ViperModuleTransitionHandler!
    
    func openOpportunities(with opportunities: [Opportunity]) {
        transitionHandler.openModule(with: WayConstants.SegueIdentifier.oportunities).thenChainUsingClosure { input in
            if let input = input as? CarouselModuleInput {
                input.setup(opportunities: opportunities)
            }
            return nil
        }
    }
}
