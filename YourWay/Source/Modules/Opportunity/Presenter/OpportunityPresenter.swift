//
//  OpportunityOpportunityPresenter.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

class OpportunityPresenter {

    // MARK: - Variables
    weak var view: OpportunityViewInput!
    var interactor: OpportunityInteractorInput!
    var router: OpportunityRouterInput!

    // MARK: - Private
}

// MARK: - OpportunityModuleInput

extension OpportunityPresenter: OpportunityModuleInput {
    
}

// MARK: - OpportunityViewOutput
    
extension OpportunityPresenter: OpportunityViewOutput {
    func viewDidLoad() {
        view.setupInitialState()
    }

    func viewWillAppear() {
        view.setupStateForViewWillAppear()
    }

    func viewWillDisappear() {
        view.setupStateForViewWillDisappear()
    }
}

// MARK: - OpportunityInteractorOutput

extension OpportunityPresenter: OpportunityInteractorOutput {
    
}
