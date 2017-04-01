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

    // MARK: - Private
    fileprivate func createViewModels() -> [CarouselCardViewModel] {
        let first = CarouselCardViewModel(UIColor.red)
        let second = CarouselCardViewModel(UIColor.blue)
        let third = CarouselCardViewModel(UIColor.yellow)
        
        return [first, second, third]
    }
}

// MARK: - CarouselModuleInput

extension CarouselPresenter: CarouselModuleInput {
    
}

// MARK: - CarouselViewOutput
    
extension CarouselPresenter: CarouselViewOutput {
    func viewDidLoad() {
        view.setupInitialState()
        view.show(viewModels: createViewModels())
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
