//
//  WayWayPresenter.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

class WayPresenter {

    // MARK: - Variables
    weak var view: WayViewInput!
    var interactor: WayInteractorInput!
    var router: WayRouterInput!
    
    var viewModels:[WayStepViewModel] = []

    // MARK: - Private
    
    func createViewModels() {
        for _ in 0...5 {
            viewModels.append(WayStepViewModel())
        }
    }
}

// MARK: - WayModuleInput

extension WayPresenter: WayModuleInput {
    
}

// MARK: - WayViewOutput
    
extension WayPresenter: WayViewOutput {
    func viewDidLoad() {
        view.setupInitialState()
        createViewModels()
        view.setup(viewModels: viewModels)
    }

    func viewWillAppear() {
        view.setupStateForViewWillAppear()
    }

    func viewWillDisappear() {
        view.setupStateForViewWillDisappear()
    }
}

// MARK: - WayInteractorOutput

extension WayPresenter: WayInteractorOutput {
    
}
