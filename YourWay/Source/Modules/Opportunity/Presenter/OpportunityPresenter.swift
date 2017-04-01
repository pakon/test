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
    var opportunity: Opportunity!
    var backgroundImage: UIImage?
}

// MARK: - OpportunityModuleInput

extension OpportunityPresenter: OpportunityModuleInput {
    
    func setup(opportunity: Opportunity, backgroundImage: UIImage?) {
        self.opportunity = opportunity
        self.backgroundImage = backgroundImage
    }
}

// MARK: - OpportunityViewOutput
    
extension OpportunityPresenter: OpportunityViewOutput {
    func viewDidLoad() {
        view.setupInitialState()
        
        view.setup(viewModel: OpportunityViewModel(opportunity: opportunity, backgroundImage: backgroundImage))
        //view.setup(viewModel: OpportunityViewModel(backgroundImage: UIImage(named: "carousel-test-1")!, iconImage: UIImage(), title: "Время для OLOLO", description: "Длинное ничего не значащее описание. Длинное ничего не значащее описание. Длинное ничего не значащее описание. Длинное ничего не значащее описание."))
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
