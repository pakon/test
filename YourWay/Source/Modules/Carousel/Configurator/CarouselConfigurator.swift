//
//  CarouselCarouselConfigurator.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class CarouselModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? CarouselViewController {
            configureViewController(viewController)
        }
    }

    private func configureViewController(_ viewController: CarouselViewController) {

        let router = CarouselRouter()
        let presenter = CarouselPresenter()
        let interactor = CarouselInteractor()
        
        viewController.moduleInput = presenter
        viewController.output = presenter

        router.transitionHandler = viewController

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
    }

}
