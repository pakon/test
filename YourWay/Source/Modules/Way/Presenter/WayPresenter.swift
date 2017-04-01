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
    
    /// The index of current reserve opportunity for carouser animation. We setup view with 0 and 1
    var startIteration = 2
    
    var timer: Timer? = nil
    // MARK: - Private
    
    func createViewModels(_ steps: [Step]) {
        
        let futureModel = WayStepViewModel()
        futureModel.title = "Завтра откроется что-то совершенно новое"
        futureModel.leftIcon = #imageLiteral(resourceName: "icon_lock_locked")
        viewModels.append(futureModel)
        
        let currentModel = WayStepViewModel(currentStep: steps.first!, delegate: self)
        viewModels.append(currentModel)
        for i in 1..<steps.count {
            let viewModel = WayStepViewModel(entity: steps[i], delegate: self)
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
    
    func stepChoosed(_ step: Step) {
        router.openOpportunities(with: Array(step.opportunities))
    }
}

// MARK: - WayInteractorOutput

extension WayPresenter: WayInteractorOutput {
    func received(steps: [Step]) {
        createViewModels(steps)
        let currentStep = steps.first!
        view.setup(viewModels: viewModels, firstImagePath: URL(string:currentStep.opportunities[0].backgroundURL)!, secondImagePath: URL(string: currentStep.opportunities[1].backgroundURL)!)
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { (timer) in
            self.view.updateBackground(reserveImageURL: URL(string: currentStep.opportunities[self.startIteration].backgroundURL)!)
            self.startIteration = (self.startIteration + 1) % currentStep.opportunities.count
        }

    }
}
