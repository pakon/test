//
//  WayWayConfigurator.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class WayModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? WayViewController {
            configureViewController(viewController)
        }
    }

    private func configureViewController(_ viewController: WayViewController) {

        let router = WayRouter()
        let presenter = WayPresenter()
        let interactor = WayInteractor()
        let viewManager = WayViewManager()
        
        viewController.moduleInput = presenter
        viewController.output = presenter
        viewController.viewManager = viewManager

        router.transitionHandler = viewController

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
    }

}
