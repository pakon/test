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
        let first = CarouselCardViewModel(image: UIImage(named: "carousel-test-1")!,
                                          backgroundImage: UIImage(named: "carousel-test-blur-1")!,
                                          text: "Пробеги по гранд каньену")
        let second = CarouselCardViewModel(image: UIImage(named: "carousel-test-2")!,
                                           backgroundImage: UIImage(named: "carousel-test-blur-2")!,
                                           text: "Проведи неделю в джунглях амазонки, где никогда не ступала нога человека. Покажи, что ты можешь больше, чем кажется!")
        
        return [first, second]
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
