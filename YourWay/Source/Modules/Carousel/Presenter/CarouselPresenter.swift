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
            let priorityStep = 1.0 / Float(opportunities.count)
            for i in 0...(opportunities.count - 1) {
                let viewModel = CarouselCardViewModel(opportunity: opportunities[i],
                                                      priority: Float(opportunities.count - i) * priorityStep)
                if viewModel != nil {
                    viewModels.append(viewModel!)
                }
                
            }
        }
    }
    var viewModels: [CarouselCardViewModel] = []

    // MARK: - Private
    fileprivate func createOpportunities() {
        let first = Opportunity()
        first.backgroundURL = "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/Nc5TR50D2kVVpq9/upload.png"
        first.desc = "Пробеги по гранд каньену ОПИСАНИЕ"
        first.icon = "icon_lock_open"
        first.title = "Пробеги по гранд каньену"
        
        let second = Opportunity()
        second.backgroundURL = "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/AjCempxi16caVRX/upload.png"
        second.desc = "Проведи неделю в джунглях амазонки ОПИСАНИЕ"
        second.icon = "icon_lock_open"
        second.title = "Проведи неделю в джунглях амазонки"
        
        setup(opportunities: [first, second])
    }
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
        //TODO: debug!
        createOpportunities()
        
        view.setupInitialState()
        view.show(viewModels: viewModels)
    }

    func viewWillAppear() {
        view.setupStateForViewWillAppear()
    }

    func viewWillDisappear() {
        view.setupStateForViewWillDisappear()
    }
}

// MARK: - CarouselInteractorOutput

extension CarouselPresenter: CarouselInteractorOutput {
    
}
