//
//  AuthorizationConfigurator.swift
//  YourWay
//
//  Created by Valentin Popkov on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class AuthorizationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? AuthorizationViewController {
            configureViewController(viewController)
        }
    }

    private func configureViewController(_ viewController: AuthorizationViewController) {

        let router = AuthorizationRouter()
        let presenter = AuthorizationPresenter()
        let interactor = AuthorizationInteractor()
        
        viewController.moduleInput = presenter
        viewController.output = presenter

        router.transitionHandler = viewController

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
        interactor.authorizationDataManager = AuthorizationDataManager()
    }

}
