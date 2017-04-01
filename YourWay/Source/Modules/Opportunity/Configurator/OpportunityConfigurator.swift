//
//  OpportunityOpportunityConfigurator.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class OpportunityModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? OpportunityViewController {
            configureViewController(viewController)
        }
    }

    private func configureViewController(_ viewController: OpportunityViewController) {

        let router = OpportunityRouter()
        let presenter = OpportunityPresenter()
        let interactor = OpportunityInteractor()
        
        viewController.moduleInput = presenter
        viewController.output = presenter

        router.transitionHandler = viewController

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
    }

}
