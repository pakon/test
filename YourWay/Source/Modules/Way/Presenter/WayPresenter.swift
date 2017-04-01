//
//  WayWayPresenter.swift
//  YourWay
//
//  Created by Mike Rudoy on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

import UIKit

class WayPresenter {

    // MARK: - Variables
    weak var view: WayViewInput!
    var interactor: WayInteractorInput!
    var router: WayRouterInput!
    
    var viewModels:[WayStepViewModel] = []

    // MARK: - Private
    
    func createViewModels(_ steps: [Step]) {
        
        let futureModel = WayStepViewModel()
        futureModel.title = "Завтра откроется что-то совершенно новое"
        futureModel.leftIcon = #imageLiteral(resourceName: "icon_lock_locked")
        viewModels.append(futureModel)
        
        let currentModel = WayStepViewModel(currentStep: steps.first!)
        viewModels.append(currentModel)
        for i in 1..<steps.count {
            let viewModel = WayStepViewModel(entity: steps[i])
            viewModels.append(viewModel)
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
        interactor.obtainSteps()
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
    func received(steps: [Step]) {
        createViewModels(steps)
        view.setup(viewModels: viewModels)
    }
}
