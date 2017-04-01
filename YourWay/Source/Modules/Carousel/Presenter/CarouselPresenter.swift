//
//  CarouselCarouselPresenter.swift
//  YourWay
//
//  Created by Vasiliy Yatsevich on 01/04/2017.
//  Copyright © 2017 MPK LLC. All rights reserved.
//

class CarouselPresenter {

    // MARK: - Variables
    weak var view: CarouselViewInput!
    var interactor: CarouselInteractorInput!
    var router: CarouselRouterInput!
    
    var opportunities: [Opportunity] = [] {
        didSet {
            viewModels = []
            actualOpportunities = []
            let priorityStep = 1.0 / Float(opportunities.count)
            for i in 0...(opportunities.count - 1) {
                let viewModel = CarouselCardViewModel(opportunity: opportunities[i],
                                                      priority: Float(opportunities.count - i) * priorityStep)
                if viewModel != nil {
                    viewModels.append(viewModel!)
                    actualOpportunities.append(opportunities[i])
                }
            }
        }
    }
    var viewModels: [CarouselCardViewModel] = []
    var actualOpportunities: [Opportunity] = []
}

// MARK: - CarouselModuleInput

extension CarouselPresenter: CarouselModuleInput {
    func setup(opportunities: [Opportunity]) {
        self.opportunities = opportunities
    }
}

// MARK: - CarouselViewOutput
    
extension CarouselPresenter: CarouselViewOutput {
    func viewDidLoad() {
        view.setupInitialState()
        view.show(viewModels: viewModels)
    }

    func viewWillAppear() {
        view.setupStateForViewWillAppear()
    }

    func viewWillDisappear() {
        view.setupStateForViewWillDisappear()
    }
    
    func cardDidChoose(_ number: Int, backgroundImage: UIImage?) {
        router.open(opportunity: actualOpportunities[number], backgroundImage: backgroundImage)
    }
}

// MARK: - CarouselInteractorOutput

extension CarouselPresenter: CarouselInteractorOutput {
    
}
